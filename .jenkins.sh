#!/bin/bash

echo "Building titan:binaries"

cd from-binaries
docker build --tag titan-bin .
