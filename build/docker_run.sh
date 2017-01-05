#!/bin/sh
set -e

## Get script paths
MY_PATH="$(dirname "$0")"          # relative
DIR="$( cd "${MY_PATH}" && pwd )"  # absolutized and normalized
ROOT_DIR="$( cd "${DIR}/../../" && pwd )"  # absolutized and normalized

## DIR Paths
PACKAGE_DIR="${ROOT_DIR}/pr"
OUTPUT_DIR="${ROOT_DIR}/packages"

## kill docker daemon after script exits (using trap)
##

cleanup() {
  rc="$?"
  set +e
  echo "-> Killing dockerd"
  pkill docker
  pkill dockerd
  pkill docker-containerd
  sleep 5
  echo "-> exiting with '${rc}'"
  exit "${rc}"
}
trap cleanup EXIT

echo "-> Starting docker...."
wrapdocker &
sleep 5

# Run kitchen <platform>
"${DIR}"/run_kitchen.sh "${1}"

# Should copy file to output dir if it does not exisit
echo ""
if ! [ -f "${OUTPUT_DIR}/README.md" ]; then
  echo "-> Copying ${PACKAGE_DIR} to ${OUTPUT_DIR}"
  cp -r ${PACKAGE_DIR}/* ${OUTPUT_DIR}
else
  echo "-> Skipping copying ${PACKAGE_DIR} to ${OUTPUT_DIR}"
fi

exit 0
