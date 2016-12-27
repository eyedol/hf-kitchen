#!/bin/bash

git config --global user.email "you@example.com"
git config --global user.name "Your Name"

cd /kitchen
bundle install
bundle exec omnibus build kitchen