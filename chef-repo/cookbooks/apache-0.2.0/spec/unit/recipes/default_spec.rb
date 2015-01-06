require 'chefspec'
require 'chefspec/berkshelf'

describe 'apache::default' do

  let(:chef_run) do
  	runner = ChefSpec::ServerRunner.new
  	runner.converge(described_recipe)
  end

  it 'sets the default attributes correctly' do
  	expect(chef_run.node['apache']['indexfile']).to eq('index1.html')
  end

  it 'writes the index1.html file to /var/www/html/index.html' do
  	expect(chef_run).to render_file('/var/www/html/index.html') \
  	.with_content('This is index1.html')
  end

  context 'when the indexfile attribute is index2' do

      let(:chef_run) do
	  	runner = ChefSpec::ServerRunner.new
	  	runner.node.set['apache']['indexfile'] = 'index2.html'
	  	runner.converge(described_recipe)
	  end

	  it 'writes the index2.html file to /var/www/html/index.html' do
	  	expect(chef_run).to render_file('/var/www/html/index.html') \
	  	.with_content('This is index2.html')
	  end

  end
end
