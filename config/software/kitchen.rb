name "kitchen"
relative_path "kitchen"

source :git => "https://github.com/test-kitchen/test-kitchen"
default_version "master"

dependency "ruby"
dependency "rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem 'install kitchen-vagrant'
  gem 'install kitchen-ec2'
  gem 'install kitchen-docker'
  gem 'install kitchen-ansiblepush'
  gem 'install kitchen-goss'
  gem 'install kitchen-verifier-serverspec'

  gem "build test-kitchen.gemspec"
  gem "install test-kitchen-*.gem --no-ri --no-rdoc --bindir '#{install_dir}/bin'", env: env
end