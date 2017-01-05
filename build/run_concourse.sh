#!/bin/sh
set -e

MY_PATH="`dirname \"$0\"`"          # relative
DIR="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

echo "starting docker...."
#/etc/init.d/docker start
wrapdocker&
sleep 5

"${DIR}"/run_kitchen.sh "${1}"
