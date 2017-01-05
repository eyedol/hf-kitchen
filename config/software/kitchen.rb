name 'kitchen'
relative_path 'kitchen'

source :git => 'https://github.com/test-kitchen/test-kitchen'
default_version 'v1.14.2'

dependency 'ruby'
dependency 'rubygems'

build do
  ## TODO: WE should pin plugins
  env = with_standard_compiler_flags(with_embedded_path)
  ## Kitchen plugins
  gem 'install kitchen-localhost --no-ri --no-rdoc'
  gem 'install kitchen-vagrant --no-ri --no-rdoc'
  gem 'install kitchen-ec2 --no-ri --no-rdoc'
  gem 'install kitchen-docker --no-ri --no-rdoc'
  gem 'install kitchen-ansiblepush --no-ri --no-rdoc'
  gem 'install kitchen-goss --no-ri --no-rdoc'
  gem 'install kitchen-verifier-serverspec --no-ri --no-rdoc'
  ## Requirements
  gem 'install bundler --no-ri --no-rdoc'
  gem 'install serverspec --no-ri --no-rdoc'
  gem 'install net-ssh --no-ri --no-rdoc'
  ## Build test-kitchen
  gem 'build test-kitchen.gemspec'
  gem "install test-kitchen-*.gem --no-ri --no-rdoc --bindir '#{install_dir}/bin'", env: env
end
