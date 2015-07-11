require 'spec_helper'

files = %w(
  /etc/apt/sources.list.d/logstashforwarder.list
  /etc/pki/tls/certs/logstash-forwarder.crt
  /etc/logstash-forwarder.conf
  )

files.each do |f|
  describe file f do
    it { should be_file }
    it { should exist }
  end
end


describe package 'logstash-forwarder' do
  it { should be_installed }
end

describe service 'logstash-forwarder' do
  it { should be_running }
  it { should be_enabled }
end

directories = %w(
  /etc/pki/tls/certs
  )

directories.each do |directory|
  describe file directory do
    it { should be_directory }
  end
end
