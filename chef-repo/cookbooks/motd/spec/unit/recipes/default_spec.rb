require 'chefspec'
require 'chefspec/berkshelf'

describe 'motd::default' do

  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'sets the default attributes correctly' do
    expect(chef_run.node['motd']['company']).to eq('Chef')
  end

  it 'writes the motd file with the company name' do
    expect(chef_run).to render_file('/etc/motd') \
    .with_content('This server is property of Chef')
  end

  context 'when the pci in_scope attribute is true' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.set['pci']['in_scope'] = true
      runner.converge(described_recipe)
    end

    it 'renders the motd template with the PCI scope notice' do
      expect(chef_run).to render_file('/etc/motd') \
      .with_content('This server is in-scope for PCI compliance')
    end
  end

  context 'when the pci in_scope attribute is false' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.set['pci']['in_scope'] = false
      runner.converge(described_recipe)
    end

    it 'renders the motd template without the PCI scope notice' do
      expect(chef_run).not_to render_file('/etc/motd') \
      .with_content('This server is in-scope for PCI compliance')
    end


  end
end
