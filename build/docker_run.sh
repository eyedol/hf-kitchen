#!/bin/sh
set -e

## Get script paths
MY_PATH="`dirname \"$0\"`"          # relative
DIR="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

## kill docker daemon after script exits (using trap)
##
cleanup() {
  echo "Killing docker"
  pkill docker
}
trap cleanup EXIT


echo "starting docker...."
wrapdocker &
sleep 5

# Run kitchen <platform>
"${DIR}"/run_kitchen.sh "${1}"

# SHould move file to output
mv pr/pkg/* packages/

exit 0
