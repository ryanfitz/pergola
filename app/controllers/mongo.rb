Pergola.controllers :mongo do  
  before do
    add_connection_to_request
    
    add_breadcrumb "Servers", "/"
  end
  
  get :index, :map => "/mongo/:id", :provides => [:html, :js] do
    add_breadcrumb @connection.title, "/"
    
    @databases = @connection.databases
    render 'mongo/index'
  end
  
  get :new_db, :with => [:id], :provides => [:js] do
    render 'mongo/new_db'
  end
  
  post :create_db, :with => [:id], :provides => [:js] do     
    if params[:db_name].include?("\s")
      flash[:error] = "Database name cannot contain spaces"
      redirect url(:mongo_new_db, :id => @connection.id, :db_name => params[:db_name])
    end
    
    if @connection.database_names.include? params[:db_name] 
      flash[:error] = "Server already contains database #{params[:db_name]}"
      redirect url(:mongo_new_db, :id => @connection.id, :db_name => params[:db_name])
    end
     
    @connection.create_database(params[:db_name])
    redirect url(:mongo, :index, :id => params[:id])
  end
  
end