# API Definition

For this document, a parameter represents some value on the controller.
It may be read-only, writable in different states, continuously-updating etc.
It may represent a configuration item, a file on disk, a sensor reading, a control input etc.

## Custom types

### Kinematics

```yaml
joint_state:
    position:
        type: float64
        unit: m (linear joints) or rad (angular joints)
    velocity:
        type: float64
        unit: m/s (linear joints) or rad/s (angular joints)
    effort:
        type: float64
        unit: N (linear joints) or Nm (angular joints)
```

### State

```yaml
controller_state:
    mode:
        type: enum
        enum_options:
            - offline
            - configure
            - e-stop
            - manual-control
            - active-pause
            - active-run
```

### ...

Other types will be required...

## Generic API

### Parameters

Interact with a parameter at a single point in time.

```yaml
parameter_list:
    request:
        namespace:
            type: string
            description: Fetch all parameters underneath this namespace
        recursive:
            type: bool
            default: False
            description: If true, fetch nested parameters as well
    response:
        parameters:
            type: string[]
            description: List of all parameters in this namespace
```

```yaml
parameter_info:
    request:
        name:
            type: string
            description: Full name of parameter including namespace (eg /joint/1/state)
    response:
        type:
            type: string
            description: Name of parameter type
        description:
            type: string
            description: Human-readable description of the parameter's purpose
        read_only:
            type: bool
            description: Is the parameter read-only?
        permission_level:
            type: int32
            description: Client permission level required to change this value
        states:
            type: controller_state[]
            description: States in which this value may be changed
```

```yaml
parameter_fetch:
    request:
        name:
            type: string
            description: Name of parameter to fetch, including namespace
    response:
        data:
            type: Any
            description: Current parameter value, type as specified by a parameter_info call
```

```yaml
parameter_set:
    request:
        name:
            type: string
        value:
            type: Any
            description: New parameter value, type as specified by a parameter_info call
    response:
        ok:
            type: bool
            description: True if the update succeeded
```

### Streaming

Request that the controller pushes a stream of messages whenever a given parameter changes.

```yaml
subscribe:
    request:
        name:
            type: string
            description: Full name of parameter including namespace to subscribe to
        rate_limit:
            type: int32
            description: Maximum number of values to send per minute.  Depending on the parameter, excess will be dropped silently or an average will be created.
    response:
        null
```

```yaml
list_subscriptions:
    request:
        null
    response:
        subscriptions:
            type: string[]
            description: List of parameters currently subscribed to
```

```yaml
unsubscribe:
    request:
        name:
            type: string
    response:
        null
```

### Control streams

Indicate to the controller that you would like to push a stream of set-value messages to it.

```yaml
init_control_stream:
    request:
        name:
            type: string
            description: Full name of parameter including namespace to open a control stream for
    response:
        ok:
            type: bool
```

```yaml
list_control_streams:
    request:
        null
    response:
        subscriptions:
            type: string[]
            description: List of parameters with active control streams
```

```yaml
cancel_control_stream:
    request:
        name:
            type: string
    response:
        null
```

## Parameters

Some example parameters.

```yaml
/joint/state:
    description: State of all joints on the controller
    type: joint_state[]
    read_only: true
/joint/*/controller/current:
    description: Joint PID current controller proportional value
    type: pid_value
/joint/${joint_index}/jog:
    description: Jog input for the given joint.
    type: joint_control
    permission_level: 3
    states: manual-control
/filesystem/download-file/${file_path}:
    description: Get the contents of a given filee
    type: string
    permission_level: 1
```
