#!/bin/bash

set -ex 

EMSCRIPTEN_SDK_VERSION=3.1.71
OPENCV_VERSION=4.10.0

cd $(dirname $0)
ROOT_DIR=$(pwd)/..
cd $ROOT_DIR

cd "${ROOT_DIR}/build"
git clone https://github.com/opencv/opencv.git || true

cp ./build_js.py ./opencv/platforms/js/build_js.py

cd opencv
git checkout $OPENCV_VERSION

cd ..
cp ./build_js.py ./opencv/platforms/js/build_js.py

cd opencv
mkdir -p build_js/bin
rm -rf build_js/bin
docker run --rm -v $(pwd):/src -u $(id -u):$(id -g) emscripten/emsdk:$EMSCRIPTEN_SDK_VERSION emcmake python3 ./platforms/js/build_js.py build_js

cd $ROOT_DIR
# cp build/opencv/build_js/bin/opencv_js.js dist/opencv-default.js

