require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Connection Model" do
  it 'can be created' do
    @connection = Connection.new
    @connection.should_not be_nil
  end
end
