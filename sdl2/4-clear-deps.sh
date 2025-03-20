#!/bin/sh
for DEP in deps/* ; do
  echo -n $DEP
  rm -rf $DEP/.dub
  rm -rf $DEP/lib
  echo "    [ OK ]"
done
