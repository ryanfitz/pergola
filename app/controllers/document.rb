Pergola.controllers :collection, :parent => [:mongo, :database, :collection] do
  before do
    add_connection_to_request params[:mongo_id]
  end
  
end