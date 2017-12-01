#!/usr/local/bin/dumb-init /bin/sh
set -e

# Start gotty
/usr/local/bin/gotty /bin/bash -l &

# Start Dropbear SSH server
dropbear -s -g -K 10 -F -R -E >/dropbear.log
