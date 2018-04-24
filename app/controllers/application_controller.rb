class ApplicationController < ActionController::Base
  before_action :configure_permitted_devise_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
 
  def configure_permitted_devise_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email,
                                                       :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :current_password,
                                                              :password_confirmation])
  end
end
