class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @projects = @user.employee.projects.paginate(page: params[:page])
  end

  def index
  end
end
