require 'spec_helper'

describe 'pci::default' do

  let(:chef_run) do
    runner = ChefSpec::Runner.new
    runner.converge(described_recipe)
  end

  it 'sets the default attributes correctly' do
    expect(chef_run.node['pci']['in_scope']).to eq(false)
  end
end
