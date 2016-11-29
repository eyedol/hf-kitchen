#
# Copyright 2016 Adham Helal
#
# All Rights Reserved.
#

name "kitchen"
maintainer "Adham Helal"
homepage "https://github.com/hellofresh/hf-kitchen"

install_dir "/opt/hellofresh/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"
dependency "kitchen"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
