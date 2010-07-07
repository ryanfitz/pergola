Pergola.controllers :database, :parent => :mongo do
  before do
    params[:id] = params[:mongo_id]
    add_connection_to_request
  end
  
  get :index, :map =>"/database/:name" do
    @database = @connection.get_database(params[:name])
    render 'database/index'
  end 
end