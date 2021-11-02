class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:department_id, :role_id, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:department_id, :role_id, :name, :email, :password, :current_password,
               employee_attributes: [:id, :profile_id, :user_id, :address, :phone_number, :working_day, profile_attributes: [:id, :name, :birthday, :home_town, :gender]])
    end
  end
end
