
# Jogging

API commands for Joggin the robot at {{JogSpeed}} rotations per minute (TODO: define jog speed)

Because of the stream like nature of jogging, jogging requests are sent as notifications without id. On a success the client will not receive any response. On a failure the API will send out a {{MotionError}} notification. Jogging requests should be sent at a regular frequency in order to maintain the current motion. When no jogging message has not been received for {{JogFrequency}} (default 100ms) milliseconds, the motion controller will immediatly stop. 

Be advised that high latency connection can result in motor stutter. Increasing the {{JogFrequency}} can fix this but will result in a more delayed stop time.

### Raw joint movements

This is a notification command. There should not be a ID in this request. 
```
{"method": "jogJoint", "params": [jointIndex, direction]}
```
Params:
    jointIndex: 0 based index for the joint.
    direction: 1 for positive direction, 0 for negative direction

Result: None
Error: 
    {{MotionError}} notification will be sent out if a jog command could not be followed.
Example:
    ```
    {"method": "jogJoint", "params": [0, 1]}
    ```
    Robot joint 0 should go in the positive direction at {{JogSpeed}}

### Tool frame jogging

This is a notification command. There should not be a ID in this request. 
```
{"method": "jogTool", "params": [toolIndex, vector]}
```
Params:
    toolIndex: 0 based index for the tool frame.
    vector: Array designating the direction vecor in XYZ format (TODO: this is an assumption on the capabilites from the motion planning team. Change this if needed)

Result: None
Error: 
    {{MotionError}} notification will be sent out if a jog command could not be followed.
Example:
    ```
    {"method": "jogTool", "params": [0, [0,1,0]]}
    ```
    Robot should go forward in the Y direction with repect to the tool frame

### Workspace frame jogging
This is a notification command. There should not be a ID in this request. 
```
{"method": "jogWorkspace", "params": [workspaceIndex, vector]}
```
Params:
    workspaceIndex: 0 based index for the workspace frame.
    vector: Array designating the direction vecor in XYZ format (TODO: this is an assumption on the capabilites from the motion planning team. Change this if needed)
    
Result: None
Error: 
    {{MotionError}} notification will be sent out if a jog command could not be followed.

Example:
    ```
    {"method": "jogWorkspace", "params": [0, [0,1,0]]}
    ```
    Robot should go forward in the Y direction with repect to the workspace frame