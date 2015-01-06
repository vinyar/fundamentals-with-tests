require 'spec_helper'

describe 'motd::default' do

	describe file('/etc/motd') do
		it { should be_file }
		it { should be_mode 644 }
	end

end
