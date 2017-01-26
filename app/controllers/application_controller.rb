class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  add_flash_types :unauthorized_message

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dob, :sex, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :dob, :sex, :address])
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def is_authorized?(action, resource)
    current_ability.can? action, resource
    # resource = params['id'] ? params['controller'].classify.constantize.find(params['id']) : params['controller'].classify.constantize
    # return redirect_to :back, unauthorized_message: 'Unauthorized.' unless current_ability.can? params['action'], resource rescue return redirect_to root_url
  end

end
