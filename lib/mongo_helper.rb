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
  
  def databases
    databases = []

    connection.database_names.each do |db_name|
      databases << get_database(db_name)
    end

    databases.sort {|x,y| x.name <=> y.name} 
  end

  def get_database(name)
    connection.db(name)
  end
  
  def create_database(name)
    db = connection.db(name)
    
    db.create_collection("pergola")
  end
  
  class FailedMongoConnection
    def connected?
      false
    end
  end
  
end