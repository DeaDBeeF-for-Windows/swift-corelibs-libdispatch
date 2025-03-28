#!/bin/bash

OUT_DIR="`pwd`/out/xdispatch_ddb"

mkdir build out
cd build
LDFLAGS+=" -fuse-ld=lld" \
cmake -DCMAKE_INSTALL_PREFIX="$OUT_DIR" \
	  -DCMAKE_C_COMPILER="clang" \
      -DCMAKE_CXX_COMPILER="clang++" \
      -DCMAKE_BUILD_TYPE=Release \
      ..
ninja
cmake --install .

mv "$OUT_DIR/bin/"* "$OUT_DIR/lib/"
rmdir "$OUT_DIR/bin"
