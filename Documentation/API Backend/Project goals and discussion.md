This document should be used as a guide for developers to understand the overall direction of this module. Later as things kick off this document can probably be removed

## Dependencies
- **[MinnowServer](https://github.com/RealTimeLogic/MinnowServer)**
	- Handle TCP/IP transmission
	- Maintains lower layer web socket needs
- TBD

## Proposed transmission protocols

### JSON RPC
Pros:
- Human readable
- Easy request response structure
- Platform agnostic
Cons:
- Considerable amount of extra data being transferred
- Slower serialization and deserialization steps

### Raw bytecode
Pros:
- Very small footprint
- Faster serialization on the server side
Cons:
- Not human readable

## Some things to think about

- Jogging:
	- Jog button pressed vs held. Is multiple messages being sent while button held or will we have a jog start and jog stop command? 
	- General requirement should be when I let go of the button for jogging then the arm stops as well. No delay because the robot is trying to execute a series of move commands.  