#!/bin/sh
set -e

[ -z "${1}" ] && echo "Require a platfrom as an argument." && exit 1

MY_PATH="`dirname \"$0\"`"          # relative
DIR="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

## Instll bundler
gem install bundle --no-rdoc --no-ri

cd "${DIR}/.."
## Install kitchen :) to build kitchen
bundle install
bundle exec kitchen test "${1}"

exit 0
