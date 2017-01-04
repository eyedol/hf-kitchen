#!/bin/sh
MY_PATH="`dirname \"$0\"`"          # relative
DIR="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

echo "run docker"
wrapdocker&

sleep 4
echo "Done sleeping"

"${DIR}"/run_kitchen.sh "${1}"
