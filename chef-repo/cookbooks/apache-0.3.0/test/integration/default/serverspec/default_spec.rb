require 'spec_helper'

describe 'apache::default' do

  describe port(80) do
    it { should be_listening.with('tcp') }
  end

  describe port(81) do
    it { should be_listening.with('tcp') }
  end

  describe command('curl -sI http://localhost:80 | head -1' ) do
    its(:stdout) { should match 'HTTP/1.1 200 OK' }
  end

  describe command('curl -sI http://localhost:81 | head -1' ) do
    its(:stdout) { should match 'HTTP/1.1 200 OK' }
  end

end