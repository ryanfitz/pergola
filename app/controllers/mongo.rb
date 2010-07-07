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
  
  get :index, :map => "/mongo/:id", :provides => [:html, :js] do
    @databases = @connection.databases
    render 'mongo/index'
  end
  
  get :new_db, :with => [:id], :provides => [:js] do
    render 'mongo/new_db'
  end
  
  post :create_db, :with => [:id], :provides => [:js] do  
    @connection.create_database(params[:db_name])
  
    redirect url(:mongo, :index, :id => params[:id])
  end
  
end