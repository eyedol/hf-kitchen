require 'rubygems'
require 'serverspec'
require 'pathname'
require 'net/ssh'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  set :backend, :exec
  set :request_pty, true
end

describe file('/tmp/provision_works') do
  it 'exists & contain YES' do
    expect(subject).to exist
    expect(subject).to be_file
    expect(subject).to contain('YES')
  end
end
