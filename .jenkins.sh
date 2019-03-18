#!/bin/bash

set -e
set -vx

#echo "Building titan:binaries"
#cd from-binaries
#docker build --tag titan-bin .

echo "Building titan:binaries"
cd from-sources
./.jenkins.sh

cd -

# That's all Floks
exit 0
