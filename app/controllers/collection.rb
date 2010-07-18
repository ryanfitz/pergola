Pergola.controllers :collection, :parent => [:mongo, :database] do
  require 'pp'
  
  before do
    add_connection_to_request params[:mongo_id]
    
    @database = @connection.get_database(params[:database_id])
    
    add_breadcrumb "Servers", url(:index)
    add_breadcrumb @connection.title, url(:mongo, :index, :id => @connection.id)
    add_breadcrumb @database.name, url(:database_index, :mongo_id => @connection.id, :name => @database.name)
  end
  
  get :index, :map =>"/collection/:name", :provides => [:html,:js] do
    add_breadcrumb params[:name], "/"
    
    @collection = @database.collection params[:name]
    @docs = @collection.find
  
    render 'collection/index'
  end
  
  get :edit_doc, :map =>"/collection/:name/doc/:doc_id", :provides => [:js] do
    add_breadcrumb params[:name], url(:collection_index, :mongo_id => @connection.id, :database_id => @database.name, :name => params[:name])
    add_breadcrumb params[:doc_id], "/"
    
    @collection = @database.collection params[:name]
    
    @document = @collection.find_one(BSON::ObjectID.from_string(params[:doc_id]))
    
    render 'collection/document/edit'
  end
  
  post :save_doc, :map => "/collection/:name", :provides => [:js] do
    @collection = @database.collection params[:name]
    
    @collection.save convert_to_mongo_document(params[:document])
    code_tag params[:value]
  end

  get :query, :map =>"/collection/:name/search", :provides => [:json] do
    puts "asdfasdfd"
  end
  
  delete :doc_destroy, :map =>"/collection/:name/doc_id/:doc_id", :provides =>[:js] do  
    collection = @database.collection params[:name]
    
    collection.remove({"_id" => BSON::ObjectID.from_string(params[:doc_id]) })
    
    redirect url(:collection_index, :mongo_id => @connection.id, :database_id => @database.name, :name => params[:name])
  end
  
end