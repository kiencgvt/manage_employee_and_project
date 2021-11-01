class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @project = current_user.employee.projects.build
      @project.project_details.new
      @projects = current_user.employee.projects.order(id: :desc).paginate(page: params[:page])
    end
  end

  def help
  end
end
