#!/bin/bash

set -ex 

EMSCRIPTEN_SDK_VERSION=3.1.71
OPENCV_VERSION=4.10.0

cd $(dirname $0)
ROOT_DIR=$(pwd)/..
cd $ROOT_DIR

cd "${ROOT_DIR}/build"
# git clone https://github.com/opencv/opencv.git || true

cd opencv
# git checkout $OPENCV_VERSION

docker run --rm -v $(pwd):/src -u $(id -u):$(id -g) emscripten/emsdk:$EMSCRIPTEN_SDK_VERSION emcmake python3 ./platforms/js/build_js.py build_js --disable_single_file

cd $ROOT_DIR
# cp build/opencv/build_js/bin/opencv.js dist/opencv-default.js
