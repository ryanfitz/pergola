Pergola.controllers :collection, :parent => [:mongo, :database] do
  get :index, :map =>"/collection/:name", :provides => [:html,:js] do
    
    render 'collection/index'
  end
end
