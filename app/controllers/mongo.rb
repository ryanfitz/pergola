Pergola.controllers :mongo do
  before do
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
  
  get :server, :with => :id do
    render 'mongo/index'
  end
  
end