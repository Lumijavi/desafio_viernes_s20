class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  check_authorization :unless => :devise_controller?
  skip_authorization_check :only => [:new, :create]

  # load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, alert: exception.message }
    end
  end
end
