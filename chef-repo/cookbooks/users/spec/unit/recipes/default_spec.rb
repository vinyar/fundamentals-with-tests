require 'spec_helper'

describe 'users::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'does something' do
    skip 'Replace this test with meaningful tests'
  end
end
