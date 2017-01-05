require_relative '../../helper_spec.rb'

describe package('kitchen') do
  it 'is installed' do
    expect(subject).to be_installed
  end
end

describe file('/opt/hellofresh/bin/kitchen') do
  it 'symlink exists' do
    expect(subject).to be_symlink
    expect(subject).to be_linked_to('/opt/hellofresh/kitchen/bin/kitchen')
  end
end

describe file('/opt/hellofresh/bin/kitchen-ansible-inventory') do
  it 'symlink exists' do
    expect(subject).to be_symlink
    expect(subject).to be_linked_to('/opt/hellofresh/kitchen/embedded/bin/kitchen-ansible-inventory')
  end
end
