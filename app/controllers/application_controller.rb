class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  
  def get_user
    @current_user = current_user
  end

  protect_from_forgery with: :exception

    def hello
      render html: "hello, world!"
    end

end
