require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "MongoHelper" do
  before :each do
    @mock_connection = mock()
    
    @connection_info = Connection.new
    @connection_info.id = 1
    
    @connection_info.connection = nil
  end

  it "can connect" do
    Mongo::Connection.stubs(:new).returns(@mock_connection)
    @mock_connection.stubs(:connected?).returns(true)

    @connection_info.connect.should be_true
  end
  
  it "fails to connect" do
    Mongo::Connection.stubs(:new).raises(Mongo::ConnectionFailure)
    
    @connection_info.connect.should be_false
  end
  
  it "does not create new connection if already connected to server" do
    Mongo::Connection.expects(:new).never
    
    @mock_connection.stubs(:connected?).returns(true)
    @connection_info.connection= @mock_connection
    
    @connection_info.should be_true
  end
end
