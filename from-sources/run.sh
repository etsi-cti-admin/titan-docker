#!/bin/bash
# Copyright ETSI 2019
# See: https://forge.etsi.org/etsi-forge-copyright-statement.txt

set -e
set -vx

docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --cap-add=NET_RAW --cap-add=NET_ADMIN --rm stftitan:latest /bin/bash -c "cd /home/etsi"

# That's all Floks
exit 0
