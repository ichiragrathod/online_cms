class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:name, :email, :password, :phone_number, :address, :city]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def require_user
    if current_user.admin?
      flash[:alert] = "You must be logged in as user to perform that action"
      redirect_to new_user_session_path
    end
  end
end
