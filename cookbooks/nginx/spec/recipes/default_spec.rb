require_relative '../spec_helper'

describe 'nginx::default' do

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it { expect(chef_run).to install_package('nginx') }
  it { expect(chef_run).to start_service('nginx') }
  it { expect(chef_run).to create_cookbook_file('/usr/share/nginx/www/index.html').with(mode: "0644")}
  
end
