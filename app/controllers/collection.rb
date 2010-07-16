Pergola.controllers :collection, :parent => [:mongo, :database] do
  before do
    params[:id] = params[:mongo_id]
    add_connection_to_request
    
    @database = @connection.get_database(params[:database_id])
    
    add_breadcrumb "Servers", url(:index)
    add_breadcrumb @connection.title, url(:mongo, :index, :id => @connection.id)
    add_breadcrumb @database.name, url(:database_index, :mongo_id => @connection.id, :name => @database.name)
  end
  
  get :index, :map =>"/collection/:name", :provides => [:html,:js] do
    add_breadcrumb params[:name], "/"
    @collection = @database.collection params[:name]
    
    @docs = @collection.find
    
    # @header = Set.new
    #     
    #     @collection.find.each do |doc|
    #       @header += doc.keys
    #     end
    #     
    #     @documents = []
    #     
    #     @collection.find.each do |doc|
    #       rdoc = {}
    #       @header.each do |head|
    #         rdoc[head] = doc[head]
    #       end
    #       @documents << rdoc
    #     end
  
    render 'collection/index'
  end
  
  get :edit_doc, :map =>"/collection/:name/doc/:doc_id", :provides => [:js] do
    render 'collection/document/edit'
  end
  
  get :query, :map =>"/collection/:name/search", :provides => [:json] do
    puts "asdfasdfd"
  end
end
