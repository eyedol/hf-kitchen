#!/bin/sh
set -e

## Get script paths
MY_PATH="`dirname \"$0\"`"          # relative
DIR="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

## PackageDIR paths
PACKAGE_DIR="${DIR}/${PACKAGE_DIR-pr}"

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

# Should move file to output dir if it does not exisit
if ! [ -f packages/README.MD ]; then
  mv ${PACKAGE_DIR}/* packages/
fi

exit 0
