class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_sanitized_params, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
