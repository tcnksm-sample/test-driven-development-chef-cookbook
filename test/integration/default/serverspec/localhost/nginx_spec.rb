require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(80) do
  it { should be_listening }
end

describe file('/usr/share/nginx/www/index.html') do
  it { should be_file }
  its(:content) { should match /Hello, Chef/ }
end
