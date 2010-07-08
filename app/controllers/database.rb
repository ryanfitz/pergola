Pergola.controllers :database, :parent => :mongo do
  before do
    params[:id] = params[:mongo_id]
    add_connection_to_request
    
    add_breadcrumb "Servers", url(:index)
    add_breadcrumb @connection.title, url(:mongo, :index, :id => @connection.id)
  end
  
  get :index, :map =>"/database/:name" do
    add_breadcrumb params[:name], "/"
    
    @database = @connection.get_database(params[:name])
    render 'database/index'
  end 
  
  delete :destroy, :with => :name, :provides => [:js] do
    @connection.connection.drop_database(params[:name])
    
    redirect url(:mongo_index, :id => @connection.id)
  end
  
end