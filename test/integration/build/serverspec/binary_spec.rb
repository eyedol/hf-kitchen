require_relative '../../helper_spec.rb'

describe 'kitchen file' do
  describe command('/opt/hellofresh/kitchen/bin/kitchen version') do
    it 'executes and returns 0' do
      expect(subject.stdout).to match('Test Kitchen version')
      expect(subject.exit_status).to eq(0)
    end
  end

  describe file('/opt/hellofresh/kitchen/bin/kitchen') do
    it 'contain proper shebang' do
      expect(subject).to contain('#!/opt/hellofresh/kitchen/embedded/bin/ruby')
    end
  end

end

describe 'kitchen-ansible-inventory file' do
  describe command('/opt/hellofresh/kitchen/embedded/bin/kitchen-ansible-inventory') do
    it 'executes and returns 0' do
      expect(subject.stdout).to match('_meta')
      expect(subject.exit_status).to eq(0)
    end
  end

  describe file('/opt/hellofresh/kitchen/embedded/bin/kitchen-ansible-inventory') do
    it 'contain proper shebang' do
      expect(subject).to contain('#!/opt/hellofresh/kitchen/embedded/bin/ruby')
    end
  end

end

describe command('/opt/hellofresh/kitchen/embedded/bin/ruby --version') do
  it 'executes and returns 0' do
    expect(subject.stdout).to match('ruby 2.1')
    expect(subject.exit_status).to eq(0)
  end
end

describe command('/opt/hellofresh/kitchen/embedded/bin/gem list') do
  it 'executes and returns 0' do
    expect(subject.stdout).to match('kitchen-ansiblepush')
    expect(subject.stdout).to match('kitchen-docker')
    expect(subject.stdout).to match('kitchen-vagrant')
    expect(subject.stdout).to match('kitchen-ec2')
    expect(subject.stdout).to match('kitchen-docker')
    expect(subject.stdout).to match('kitchen-ansiblepush')
    expect(subject.stdout).to match('kitchen-goss')
    expect(subject.stdout).to match('kitchen-verifier-serverspec')
    expect(subject.exit_status).to eq(0)
  end
end
