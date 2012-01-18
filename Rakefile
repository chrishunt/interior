require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc 'Default: Run specs'
task :default => 'spec:fast'

desc "Run all specs"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ['--color', '-d']
end

namespace :spec do
  desc "Run enemy spec"
  RSpec::Core::RakeTask.new(:enemy) do |t|
    t.rspec_opts = ['--color', '-d', '--tag', 'enemy']
  end

  desc "Run all specs except enemy spec"
  RSpec::Core::RakeTask.new(:fast) do |t|
    t.rspec_opts = ['--color', '-d', '--tag', '~enemy']
  end
end
