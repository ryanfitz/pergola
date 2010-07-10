require 'timeout'

module MongoHelper
  
  def self.proxy_calls_to_mongo_connection
    Mongo::Connection.instance_methods(false).each do |meth|
      unless MongoHelper.method_defined? meth or [:host, :port].include? meth
        define_method(meth) { |*args, &blk| server.send(meth, *args, &blk) }
      end 
    end
  end
  
  proxy_calls_to_mongo_connection
  
  def servers
    @@servers ||= {}
  end
  
  def server
    servers[id]
  end
  
  def server=(mongo_server)    
    servers[id] = mongo_server
  end
  
  def connect
    unless not server.nil? and server.connected?
      begin 
        timeout(5) do
          self.server=(Mongo::Connection.new(host, port))
        end
      rescue Timeout::Error, Mongo::ConnectionFailure
        self.server= FailedMongoConnection.new
      end
    end
    
    server.connected?    
  end
  
  def databases
    databases = []

    server.database_names.each do |db_name|
      databases << get_database(db_name)
    end

    databases.sort {|x,y| x.name <=> y.name} 
  end

  def get_database(name)
    server.db(name)
  end
  
  def server_status 
    server.db("admin").command({:serverStatus => 1})
  end
  
  def create_database(name)
    db = server.db(name)
    
    db.create_collection("pergola")
  end
  
  class FailedMongoConnection
    def connected?
      false
    end
  end
  
end