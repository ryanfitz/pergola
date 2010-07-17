# Helper methods defined here can be accessed in any controller or view in the application

Pergola.helpers do  
  def add_connection_to_request
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
    if object.is_a? String
      "\"#{object}\""
    else
      object.to_s
    end
  end
  
  def code_tag(object)    
    content_tag(:code, pretty_print(object), :class => determin_style_class_for(object) )
  end
  
end