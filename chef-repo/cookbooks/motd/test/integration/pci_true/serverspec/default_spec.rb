require 'spec_helper'

describe 'motd::default' do

  describe file('/etc/motd') do
    it { should be_file }
    it { should contain 'This server is property of Chef' }
    it { should contain 'This server is in-scope for PCI compliance' }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

end
