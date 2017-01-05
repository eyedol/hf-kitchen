#!/bin/sh
set -e

MY_PATH="`dirname \"$0\"`"          # relative
DIR="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

echo "run docker"
/etc/init.d/docker start

echo "Done sleeping"

"${DIR}"/run_kitchen.sh "${1}"
