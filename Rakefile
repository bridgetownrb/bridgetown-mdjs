require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
  t.warning = false
end

RuboCop::RakeTask.new

task :test_and_release => [:rubocop, :test] do |t|
  # Release the gem if rubocop and tests pass
  Rake::Task["release"].invoke
end

task :default => :test
