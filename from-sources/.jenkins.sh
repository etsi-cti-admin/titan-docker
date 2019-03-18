#!/bin/bash

set -vx
set -e

cd $(dirname $0)

OLD_PWD=`pwd`

./build.sh
./run.sh

cd ${OLD_PWD}

# That's all Floks
exit 0
