source 'https://rubygems.org'

# Install omnibus
gem 'omnibus', '~> 5.5'
gem 'pristine'
gem 'dep-selector-libgecode'
gem 'kitchen-ec2'
gem 'kitchen-docker'
gem 'kitchen-ansiblepush'
gem 'kitchen-goss'
gem 'kitchen-verifier-serverspec'
gem 'kitchen-vagrant'
gem 'omnibus-software', github: 'opscode/omnibus-software'

# This development group is installed by default when you run `bundle install`,
# but if you are using Omnibus in a CI-based infrastructure, you do not need
# the Test Kitchen-based build lab. You can skip these unnecessary dependencies
# by running `bundle install --without development` to speed up build times.
group :development do
  # Use Berkshelf for resolving cookbook dependencies
  gem 'berkshelf', '~> 4.3'
  # Use Test Kitchen with Vagrant for converging the build environment
  gem 'test-kitchen',    '~> 1.4'
end
