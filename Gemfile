source 'https://rubygems.org'

# Install omnibus
gem 'dep-selector-libgecode'
gem 'kitchen-docker', git: 'https://github.com/ahelal/kitchen-docker.git',
                      branch: 'feature/alpine'
gem 'kitchen-vagrant'
gem 'omnibus', '~> 5.5'
gem 'omnibus-software', github: 'opscode/omnibus-software'
gem 'pristine'
gem 'test-kitchen', '~> 1.4'

group :development do
  gem 'kitchen-verifier-serverspec'
  gem 'net-ssh'
  gem 'serverspec'
end
