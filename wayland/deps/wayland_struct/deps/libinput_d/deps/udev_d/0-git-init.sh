#!/bin/sh
_SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
_NAME=$(basename "$_SCRIPT_DIR")
git init
git add -A .
git commit -m "init"
git remote add origin git@github.com:vitalfadeev/${_NAME}.git
git push --set-upstream origin master
