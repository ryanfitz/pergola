require 'timeout'

module MongoHelper
  @@connections = {}
  
  def connect?(connection)
    begin 
        timeout(5) do
            con = Mongo::Connection.new(connection.host, connection.port)
            @@connections[connection.id] = con
            true
        end
    rescue Timeout::Error, Mongo::ConnectionFailure
        false
    end    
  end

  # def self.connection=(connection)
  #      @@connection = new_connection
  #    end
end