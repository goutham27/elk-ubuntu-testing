require_relative 'spec_helper'

describe file '/opt/kibana4' do
  it { should be_directory }
end

describe file '/etc/initd./kibana4' do
  it { should be_file }
  it { should exist }
end

describe service 'kibana4' do
  it { should be_enabled }
  it { should be_running }
end
