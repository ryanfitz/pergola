class Pergola < Padrino::Application
  register Padrino::Mailer
  register Padrino::Helpers
  register SassInitializer

  ##
  # Application configuration options
  #
  # set :raise_errors, true     # Show exceptions (default for development)
  # set :public, "foo/bar"      # Location for static assets (default root/public)
  # set :reload, false          # Reload application files (default in development)
  # set :default_builder, "foo" # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"     # Set path for I18n translations (defaults to app/locale/)
  enable  :sessions           # Disabled by default
  # disable :flash              # Disables rack-flash (enabled by default if sessions)
  # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #     disable :asset_stamp # no asset timestamping for dev
  #   end
  #

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #
  
  get :index, :respond_to => [:html, :js] do
    @connections = Connection.all
    render 'connections/index'
  end
  
  get :new, :respond_to => [:html, :js] do
    @connection = Connection.new
    render 'connections/new'
  end
  
  get :edit, :with => :id, :respond_to => [:html, :js] do
    @connection = Connection.find(params[:id])
    render 'connections/new'
  end
  
  post :create, :respond_to => [:html, :js] do
    @connection = Connection.new(params[:connection])
    if @connection.save
      flash[:notice] = 'Connection was Saved'
      redirect url(:index)
    else
      render 'connections/new'
    end
  end
  
  put :update, :with => :id do
    @connection = Connection.find(params[:id])
    if @connection.update_attributes(params[:connection])
      flash[:notice] = 'Connection was successfully updated.'
      redirect url(:index)
    else
      redirect url(:edit, :id => @connection.id)
    end
  end
  
  delete :destroy, :with => :id, :respond_to => [:html, :js] do
    connection = Connection.find(params[:id])
    if connection.destroy
      flash[:notice] = 'Connection was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Post!'
    end

    redirect url(:index)
  end
  
end