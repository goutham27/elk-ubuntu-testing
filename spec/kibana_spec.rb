require_relative 'spec_helper'

describe file '/opt/kibana' do
  it { should be_directory }
end

describe file '/etc/init.d/kibana4' do
  it { should be_file }
  it { should exist }
end

describe service 'kibana4' do
  it { should be_enabled }
end
describe service 'kibana' do
  it { should be_running }
end

describe port 5601 do
  it { should be_listening }
end
