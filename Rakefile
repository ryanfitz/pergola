begin
  require 'rubygems'
  require 'bundler'
  rescue LoadError
    puts <<MSG
    
Pergola requires bundler.
You can install them as follows:
  
  gem install bundler

MSG
  exit
end

desc 'Setup the environment to run pergola'
task :setup do
  puts "Setting up pergola environment..."
  puts "Installing dependencies..."
  sh "bundle install"
  
  puts "finished installing dependencies"
  
  require File.dirname(__FILE__) + '/config/boot.rb'
  require 'thor'
  require 'padrino-core/cli/rake'

  PadrinoTasks.init
  Rake::Task["ar:setup"].invoke
  
  puts "Finished setting up pergola"
end
