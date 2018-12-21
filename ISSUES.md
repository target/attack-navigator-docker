## Issues tracking and resolution

### 1. Make failing to build

If you get the error below and got a build error:
```
> node install

node-pre-gyp ERR! Tried to download(404): https://fsevents-binaries.s3-us-west-2.amazonaws.com/v1.1.3/fse-v1.1.3-node-v64-darwin-x64.tar.gz
node-pre-gyp ERR! Pre-built binaries not found for fsevents@1.1.3 and node@10.11.0 (node-v64 ABI, unknown) (falling back to source compile with node-gyp)
node-pre-gyp ERR! Tried to download(undefined): https://fsevents-binaries.s3-us-west-2.amazonaws.com/v1.1.3/fse-v1.1.3-node-v64-darwin-x64.tar.gz
node-pre-gyp ERR! Pre-built binaries not found for fsevents@1.1.3 and node@10.11.0 (node-v64 ABI, unknown) (falling back to source compile with node-gyp)

```

#### Resolution
This is fixed.  The original problem was that the ATT&CK Navigator module has a dependency on fsevents v1.1.3 when building on OS X. It tried to pull down precompiled binaries for node.js (10.11.0), but they weren't available.

We now use a Docker container with `node` installed inside it to build, so the build environment is consistent every time (and it's not OS X, so fsevents isn't even used.)

-------------
