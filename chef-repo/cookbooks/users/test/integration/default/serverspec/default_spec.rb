require 'spec_helper'

describe 'users::default' do

  # Make sure the bobo & frank users are created
  describe user('bobo') do
    it { should exist }
    it { should have_uid 2000 }
    it { should belong_to_group 'clowns' }
    it { should have_home_directory '/home/bobo' }
    it { should have_login_shell '/bin/bash' }
  end

  describe user('frank') do
    it { should exist }
    it { should have_uid 2001 }
    it { should belong_to_group 'clowns' }
    it { should have_home_directory '/home/frank' }
    it { should have_login_shell '/bin/bash' }
  end

  # Make sure the clowns group is created
  describe group('clowns') do
    it { should exist }
    it { should have_gid 3000 }
  end

end
