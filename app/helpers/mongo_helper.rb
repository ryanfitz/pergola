# Helper methods defined here can be accessed in any controller or view in the application

Pergola.helpers do  
  def add_connection_to_request
    if params[:id].nil?
      redirect url_for :index
    end
    
    @connection = Connection.find_by_id(params[:id])
    if @connection.nil?
      halt 404, "Server Not Found!"
    end
    
    unless @connection.connect
      halt 403, "Can't Connect"
    end
    
  end
end