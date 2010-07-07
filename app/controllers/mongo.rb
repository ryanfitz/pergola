Pergola.controllers :mongo do
  before do
    add_connection_to_request
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