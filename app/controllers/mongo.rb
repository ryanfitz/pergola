Pergola.controllers :mongo do
  include MongoHelper
  
  before do
    if params[:id].nil?
      redirect url_for :index
    end
    
    @connection = Connection.find_by_id(params[:id])
    
    if @connection.nil?
      halt 404, "Server Not Found!"
    end
    
    unless connect? @connection
      halt 403, "Can't Connect"
    end
    
  end
  
  get :index, :with => [:id] do
    
    render 'mongo/index'
  end
  
end