#!/bin/sh

set -e

if [ ! -d /kitchen/pkg ]; then
  echo Packages not found
  exit 1
fi

if [ -e /etc/os-release ]; then
  . /etc/os-release
fi

if [ "$NAME" = 'Ubuntu' ]; then
  echo Installing kitchen packages...
  sudo dpkg -i /kitchen/pkg/*.deb
else
  echo Unknown OS detected.
  exit 1
fi
