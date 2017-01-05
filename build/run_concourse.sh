#!/bin/sh
set -e

## kill docker
##
cleanup() {
  pkill docker
}
trap cleanup EXIT

MY_PATH="`dirname \"$0\"`"          # relative
DIR="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

echo "starting docker...."
wrapdocker&
sleep 5

"${DIR}"/run_kitchen.sh "${1}"
