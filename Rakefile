# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "email2face"
  gem.homepage = "http://github.com/jarred-sumner/email2face"
  gem.license = "MIT"
  gem.summary = %Q{You give email2face an email, and it gives you a link to their face }
  gem.description = %Q{ Email2Face finds an email's corresponding Facebook profile, and then gives you a link to their profile picture. It requires a Facebook account to work. I highly recommend that you make a Facebook just for it. See http://github.com/jarred-sumner/email2face for more details. }
  gem.email = "jarred@jarredsumner.com"
  gem.authors = ["Jarred Sumner"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end


task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "email2face #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
