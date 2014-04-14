require 'rspec/core'
require 'rspec/core/rake_task'
require 'foodcritic'
require 'kitchen/rake_tasks'

task :default => [:knifetest, :foodcritic, :chefspec]

RSpec::Core::RakeTask.new(:chefspec) do |spec|
  spec.pattern    = "cookbooks/*/spec/recipes/*_spec.rb"
  spec.rspec_opts = ["-cfs"]
end

# Experimental (Not released, only in github)
FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['any'], :cookbook_path => Dir.glob("cookbooks/*")}
end

desc "Syntax checking"
task :knifetest do
  sh "knife", "cookbook", "test", "-a",
  "-o", "cookbooks",
  "--config", ".knife.rb"
end
