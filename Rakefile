require 'rspec/core'
require 'rspec/core/rake_task'
require 'foodcritic'
require 'kitchen/rake_tasks'
require 'dotenv'

task :default => [:knifetest, :foodcritic, :chefspec]

RSpec::Core::RakeTask.new(:chefspec) do |spec|
  spec.pattern    = "cookbooks/*/spec/recipes/*_spec.rb"
  spec.rspec_opts = ["-cfs"]
end

# Experimental (Not released, only in github)
FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['any']}
end

desc "Syntax checking"
task :knifetest do
  sh "knife cookbook test -a -o cookbooks/"
end

# Read .env screats
Dotenv.load

# Test-kitchen default tasks
Kitchen::RakeTasks.new

# Test-kitchen tasks
namespace :kitchen do
  desc "Show instances"
  task :list do
    sh "kitchen list"
  end

  desc "Destroy instances"
  task :destroy do
    sh "kitchen destroy"
  end
end

# Alias
def alias_tasks tasks
  tasks.each do |new, old|
    task new, [*Rake.application[old].arg_names] => [old]
  end
end

# Register alias
alias_tasks [
             [:k, "kitchen:all"],
             [:kl, "kitchen:list"],
             [:kd, "kitchen:destroy"]
            ]


