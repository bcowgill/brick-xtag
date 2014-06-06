#!/bin/bash
# update x-tag-core to latest
pushd ..

cd x-tag-core
git pull origin master
git submodule update
npm install
grunt polyfill
grunt build

popd
