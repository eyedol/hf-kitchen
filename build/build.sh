#!/bin/sh
set -e

export PATH=${PATH}:/usr/local/bin/
gem install build
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

cd /kitchen
bundle install
bundle exec omnibus build kitchen