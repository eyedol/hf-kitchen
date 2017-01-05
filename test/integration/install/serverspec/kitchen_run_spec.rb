require_relative '../../helper_spec.rb'

describe command('cd /tmp/kitchen_in_kitchen && /opt/hellofresh/bin/kitchen test localhost') do
  it 'runs kitchen test' do
    expect(subject.stdout).to match('Starting Kitchen')
    expect(subject.stdout).to match('Creating <default-localhost>')
    expect(subject.stdout).to match('Converging <default-localhost>')
    expect(subject.stdout).to match('Verifying <default-localhost>')
    expect(subject.stdout).to match('0 failures')
    expect(subject.stdout).to match('Finished testing <default-localhost>')
    expect(subject.stdout).to match('Kitchen is finished')
    expect(subject.exit_status).to eq(0)
  end
end
