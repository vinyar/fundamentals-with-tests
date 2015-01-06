require 'spec_helper'

describe 'role_test::base' do

  describe file('/etc/chef/validation.pem') do
    it { should_not be_file }
  end

end