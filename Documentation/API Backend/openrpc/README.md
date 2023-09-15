# OpenRPC Document

The API is documented here using the OpenRPC 1.2.4 standard. Note that there are later published versions of the standard, but the available tooling is implemented for the v1.2.4 spec.

The full api is defined in openrpc.json, however, this means reading and updating a single file would become unwieldy and merge conflicts would arise. To mitigate this, [open-rpc-compiler](https://www.npmjs.com/package/open-rpc-compiler?activeTab=readme) is used to break each method and schema into its own file organized in this directory's subdirectories, named for the elements they comprise in the openrpc.json doc.


## Install
```
npm install open-rpc-compiler --no-save
```

To compile the elements into the openrpc.json file run the following command from this directory.
```
open-rpc-compile > openrpc.json
```
