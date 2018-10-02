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
The problem is that the ATT&CK Navigator module has a dependency on fsevents v1.1.3. It's trying to pull down precompiled binaries for your version of node.js (10.11.0), but they're not available

Check your node version.
 * `node -v`

If your node version is `v10.x`, downgrade it to `v8.x`. 
```
nvm install 8.11.4
nvm use 8.11.4

# and installing node-gyp globally:
npm install -g node-gyp
```

Or:
* Remove the attack-navigator/nav-app/package-lock.json file and restart the build. It'll fetch a newer version of `fsevents`.

-------------
