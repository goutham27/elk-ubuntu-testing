require 'spec_helper'

describe package 'elasticsearch' do
  it { should be_installed }
end

describe service 'elasticsearch' do
  it { should be_enabled }
  it { should be_running }
end

%w(9200 9300).each do |el_port|
  describe port el_port do
    it { should be_listening }
  end
end
