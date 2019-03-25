#!/bin/bash

#set -e
set -vx

cd $(dirname $0)

OLD_PWD=`pwd`

./build.sh
./run.sh

cd ${OLD_PWD}

# That's all Floks
exit 0
