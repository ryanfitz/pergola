begin
  require 'rubygems'
  require 'bundler'
  rescue LoadError
    puts <<MSG
    
Pergola requires bundler.
You can install bundler as follows:
  gem install bundler

MSG
  exit
end

require File.dirname(__FILE__) + '/config/boot.rb'
require 'thor'
require 'padrino-core/cli/rake'

PadrinoTasks.init