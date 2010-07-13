Pergola.controllers :database, :parent => :mongo do
  before do
    params[:id] = params[:mongo_id]
    add_connection_to_request
    
    add_breadcrumb "Servers", url(:index)
    add_breadcrumb @connection.title, url(:mongo, :index, :id => @connection.id)
  end
  
  get :index, :map =>"/database/:name", :provides => [:html,:js] do
    add_breadcrumb params[:name], "/"
    
    @database = @connection.get_database(params[:name])
    render 'database/index'
  end 
  
  delete :destroy, :with => :name, :provides => [:js] do
    @connection.drop_database(params[:name])
    
    redirect url(:mongo_index, :id => @connection.id)
  end
  
  get :repair, :with => :name, :provides => [:js] do
    render 'database/repair'
  end
  
  post :repair, :with => :name, :provides => [:js] do
    @connection.repair_database(params[:name])
    
    flash[:notice] = "Database #{params[:name]} successfully repaird"
    
    redirect url(:database_index, :mongo_id => @connection.id, :name => params[:name])
  end
  
  get :clone, :with => :name, :provides => [:js] do
    @connections = Connection.all
    
    render 'database/clone'
  end
  
  post :clone, :with => :name do
    puts "figure out how to clone!!!"
  end
  
  get :new_collection, :with => :name, :provides => [:js] do
    render 'database/collection/new'
  end
  
  post :new_collection, :with => :name, :provides => [:js] do
    if @connection.get_database(params[:name]).collection_names.include? params[:collection_name]
      flash[:error] = "collection #{params[:collection_name]} already exists"
      
      redirect url(:database_new_collection, :mongo_id => @connection.id, :name => params[:name])
    end
    
    @connection.get_database(params[:name]).create_collection(params[:collection_name], :capped => params[:capped], :size => params[:size], :max => params[:max_records])
        
    redirect url(:database_index, :mongo_id => @connection.id, :name => params[:name])
  end
  
end