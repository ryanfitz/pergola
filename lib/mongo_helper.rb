require 'timeout'

module MongoHelper
  def connections
    @@connections ||= {}
  end
  
  def connection
    connections[id]
  end
  
  def connection=(mongo_connection)
    connections[id] = mongo_connection
  end
  
  def connect
    unless not connection.nil? and connection.connected?
      begin 
        timeout(5) do
          self.connection=(Mongo::Connection.new(host, port))
        end
      rescue Timeout::Error, Mongo::ConnectionFailure
        self.connection= FailedMongoConnection.new
      end
    end
    
    connection.connected?    
  end
  
  class FailedMongoConnection
    def connected?
      false
    end
  end
  
end