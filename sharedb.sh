#!/usr/bin/env bash


# build:clean
npm run build:clean

# pack
npm run pack

# build
npm run build

# dev
npm run dev


electron ./dist/electron/main.js


# unzip
npm install -g asar
asar extract app.asar


### debug debug debug
# https://nodejs.org/en/docs/guides/debugging-getting-started/
electron --inspect-brk=5858 dist/electron/main.js
# open -a "/Applications/Google Chrome.app" 'chrome://inspect'
# Open chrome://inspect in a Chromium-based browser or edge://inspect in Edge.
# Click the Configure button and ensure your target host and port are listed.



### build build build
cd /opt/limi/
git clone https://github.com/oudream/lishi-sharedb.git --recursive
cd lishi-sharedb
#
docker run --rm -ti \
 --env-file <(env | grep -iE 'DEBUG|NODE_|ELECTRON_|YARN_|NPM_|CI|CIRCLE|TRAVIS_TAG|TRAVIS|TRAVIS_REPO_|TRAVIS_BUILD_|TRAVIS_BRANCH|TRAVIS_PULL_REQUEST_|APPVEYOR_|CSC_|GH_|GITHUB_|BT_|AWS_|STRIP|BUILD_') \
 --env ELECTRON_CACHE="/root/.cache/electron" \
 --env ELECTRON_BUILDER_CACHE="/root/.cache/electron-builder" \
 -v ${PWD}:/project \
 -v ${PWD##*/}-node-modules:/project/node_modules \
 -v ~/.cache/electron:/root/.cache/electron \
 -v ~/.cache/electron-builder:/root/.cache/electron-builder \
 electronuserland/builder:wine-05.18
# docker pull electronuserland/builder:wine-05.18
npm i -g electron electron-builder
npm i # or yarn # or npm install
#electron-builder --linux
#electron-builder --mac
#electron-builder --windows
npm run build:windows
npm run build:linux
npm run build:mac



### QA
# Cross-Origin Request Blocked
# https://github.com/axios/axios/issues/853



### backup
#
#      {
#        test: /\.(js|vue)$/,
#        enforce: 'pre',
#        exclude: /node_modules/,
#        use: {
#          loader: 'eslint-loader',
#          options: {
#            formatter: require('eslint-friendly-formatter')
#          }
#        }
#      },
