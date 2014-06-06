#!/bin/bash
# pull down third party dependencies

set -e

DIR=..

pushd $DIR

if /bin/false; then
# https://github.com/x-tag/core
git clone https://github.com/x-tag/core x-tag-core --recursive
cd x-tag-core
npm install     # installs all the required dependencies using package.json
grunt polyfill  # rebuilds polyfill file
grunt build     # outputs x-tag-core.js and x-tag-core.min.js to ./dist
cd ..

# https://github.com/x-tag/core/wiki/Creating-X-Tag-Components
git clone git://github.com/x-tag/web-component-stub.git
cp -r web-component-stub my-test-component
cd my-test-component
git remote rm origin
#git remote add origin git@github.com:bcowgill/my-test-component.git
npm install
bower install
grunt build
cd ..

# TODO try https://github.com/x-tag/yo-x-tag-generator
# uses yeoman to build a new web component template
fi

# Brick library # https://github.com/mozilla/brick/#building-brick-from-source
git clone git@github.com:mozilla/brick.git
cd brick
npm install
bower install
grunt

# to pull in components to work on them
bower install
grunt clone-repos
grunt build --dev

cd ..

popd

#https://github.com/mozilla/brick/releases/download/1.0.1/brick-1.0.1.zip
# http://mozilla.github.io/brick/download.html


if /bin/false; then
[ ! -d $DIR/lib/3rdparty ] && mkdir -p $DIR/lib/3rdparty 
pushd $DIR/lib/3rdparty
wget https://github.com/mozilla/brick/releases/download/1.0.1/brick-1.0.1.zip
ls -al OpenLayers.js
echo Finding Version...
perl -ne 'print "$1\n" if m{(VERSION_NUMBER \s* : \s* "[^"]+)"}xms' OpenLayers.js

wget http://openlayers.org/download/OpenLayers-2.13.1.tar.gz
tar xvzf OpenLayers*.tar.gz

popd
fi

