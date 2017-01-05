#!/bin/sh
set -e

## Get script paths
MY_PATH="$(dirname "$0")"          # relative
DIR="$( cd "${MY_PATH}" && pwd )"  # absolutized and normalized
ROOT_DIR="$( cd "${ROOT_DIR}/../" && pwd )"  # absolutized and normalized

## DIR Paths
PACKAGE_DIR="${ROOT_DIR}/${INPUT-pr}"
OUTPUT_DIR="${ROOT_DIR}/packages/"

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
if ! [ -f "${OUTPUT_DIR}/README.MD" ]; then
  echo ""
  echo "-> Moving ${PACKAGE_DIR} to ${OUTPUT_DIR}"
  echo ""
  cp -r ${PACKAGE_DIR}/* ${OUTPUT_DIR}
fi

exit 0
