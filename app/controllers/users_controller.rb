class UsersController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @projects = @user.employee.projects.order(id: :desc).paginate(page: params[:page])
  end

  def index
    authorize current_user
    @users = User.paginate(page: params[:page])
  end

  def destroy
    authorize current_user
    User.find(params[:id]).destroy
    flash[:success] = "User deleted!"
    redirect_to users_url
  end

end
