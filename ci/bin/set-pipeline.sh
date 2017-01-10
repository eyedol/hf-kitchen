#!/bin/sh

# Assign some variables...
TARGET=ci-platform
PIPELINE=hf-kitchen

echo Setting pipeline...

fly -t $TARGET sp -p "${PIPELINE}" -c ../pipeline.yml --load-vars-from=./.vars
