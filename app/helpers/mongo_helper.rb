# Helper methods defined here can be accessed in any controller or view in the application

Pergola.helpers do  
  def add_connection_to_request(connection_id)
    if connection_id.nil?
      redirect url_for :index
    end
    
    @connection = Connection.find_by_id(connection_id)
    if @connection.nil?
      halt 404, "Server Not Found!"
    end
    
    unless @connection.connect
      halt 403, "Can't Connect"
    end
  end
  
  def add_breadcrumb(name, url)
    @breadcrumbs ||= []
    @breadcrumbs << {:name => name, :link => url}
  end
    
  def render_breadcrumb
    partial "layouts/breadcrumb"
  end
  
  def determin_style_class_for(object)
    if object.is_a? BSON::ObjectID 
      return "string"
    else
      object.class.name.downcase
    end
  end
  
  def pretty_print(object)
    if object.is_a? String or object.is_a? BSON::ObjectID
      "\"#{object}\""
    else
      object.to_s
    end
  end
  
  def code_tag(object)    
    content_tag(:code, pretty_print(object), :class => determin_style_class_for(object) )
  end
  
  def convert_to_mongo_document(hash)
    document = JSON.parse(params[:document])
    document["_id"] = BSON::ObjectID.from_string(document["_id"])
    
    document
  end
  
end