#!/bin/sh
CDIR=`pwd`
cd deps/vendor/c/
./build-lib.sh
cd $CDIR
#dub run --compiler=ldc2
dub run