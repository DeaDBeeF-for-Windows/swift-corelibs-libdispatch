#!/bin/bash

# $1 location

if [ $# -ne 1 ]; then
   echo "this script takes 1 argument"
   exit 1
fi

rm -v "$1/lib/BlocksRuntime.lib" "$1/lib/dispatch.lib"
rmdir -v "$1/lib"

mv -v "$1/bin" "$1/lib"

sed 's/^typedef/\/\/typedef/g' -i "$1/include/os/generic_win_base.h"

rm -rv "$1/share"
