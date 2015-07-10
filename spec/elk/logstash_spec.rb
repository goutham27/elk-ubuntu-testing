require 'spec_helper'

files = %w(
  /etc/apt/sources.list.d/logstash.list
  /etc/pki/tls/private/logstash-forwarder.key
  /etc/pki/tls/certs/logstash-forwarder.crt
  /etc/logstash/conf.d/01-lumberjack-input.conf
  /etc/logstash/conf.d/10-syslog.conf
  /etc/logstash/conf.d/30-lumberjack-output.conf
  )

files.each do |f|
  describe file f do
    it { should be_file }
    it { should exist }
  end
end


describe package 'logstash' do
  it { should be_installed }
end

directories = %w(
  /etc/pki/tls/certs
  /etc/pki/tls/private
  )

directories.each do |directory|
  describe file directory do
    it { should be_directory }
  end
end

describe port 5000 do
  it { should be_listening }
end
