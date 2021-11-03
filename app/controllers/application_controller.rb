class ApplicationController < ActionController::Base

  include Pundit

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:department_id, :role_id, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:department_id, :role_id, :name, :email, :password, :current_password,
               employee_attributes: [:id, :profile_id, :user_id, :address, :phone_number, :working_day, profile_attributes: [:id, :name, :birthday, :home_town, :gender]])
    end
  end

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
