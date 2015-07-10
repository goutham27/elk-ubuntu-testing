require 'spec_helper'

describe file '/etc/nginx/htpasswd.users' do
  it { should be_file }
  it { should exist }
end

%w(nginx apache2-utils).each do |pkg| 
  describe package pkg do
    it { should be_installed }
  end
end
describe service 'nginx' do
  it { should be_running }
  it { should be_enabled }
end

describe file '/etc/nginx/sites-available/default' do
  it { should contain 'proxy_pass http://localhost:5601' }
end

describe port 80 do
  it { should be_listening }
end
