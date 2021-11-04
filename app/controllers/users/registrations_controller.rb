class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_scope!, only: [:new, :create, :edit, :update, :destroy]

  def new
    authorize current_user

    super
  end

  def create
    authorize current_user

    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?

        Profile.create
        Employee.create profile_id: Profile.last.id, user_id: User.last.id
        flash[:success] = "User created!"

        redirect_to users_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
