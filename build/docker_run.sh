#!/bin/sh
set -e

## Get script paths
MY_PATH="$(dirname "$0")"          # relative
DIR="$( cd "${MY_PATH}" && pwd )"  # absolutized and normalized
ROOT_DIR="$( cd "${DIR}/../../" && pwd )"  # absolutized and normalized

## DIR Paths
INPUT_DIR="${ROOT_DIR}/${INPUT_DIR-pr}"
OUTPUT_DIR="${ROOT_DIR}/packages"

## kill docker daemon after script exits (using trap)
##

cleanup() {
  rc="$?"
  set +e
  echo "-> Killing dockerd"
  pkill -9 dockerd
  pkill -9 docker-containerd
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
  echo "-> Copying ${INPUT_DIR} to ${OUTPUT_DIR}"
  cp -r ${INPUT_DIR}/* ${OUTPUT_DIR}
else
  echo "-> Skipping copying ${INPUT_DIR} to ${OUTPUT_DIR}"
fi

exit 0
