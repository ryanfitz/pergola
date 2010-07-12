begin
  require 'rubygems'
  require 'bundler'
  require 'padrino'
  rescue LoadError
    puts <<MSG
    
Pergola requires bundler and padrino.
You can install them as follows:
  
  gem install bundler
  gem install padrino

MSG
  exit
end

require File.dirname(__FILE__) + '/config/boot.rb'
require 'thor'
require 'padrino-core/cli/rake'

PadrinoTasks.init