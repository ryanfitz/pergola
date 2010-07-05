PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

Spec::Runner.configure do |conf|
  conf.include Rack::Test::Methods
  conf.mock_with :mocha
end

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  Pergola.tap { |app|  }
end
