#!/bin/bash

# in case build is executed from outside current dir be a gem and change the dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd -P)"
cd $SCRIPT_DIR

rm -rf outfw
./_build.sh bed || exit $?
./_build.sh noz || exit $?
./_build.sh mcu || exit $?
./_build.sh btteddy || exit $?

rm -rf fw/K1/*.bin
rm -rf fw/K1/*.uf2
mv outfw/*.bin fw/K1/
mv outfw/*.uf2 fw/K1/
rm -rf outfw/
