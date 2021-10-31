class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @project = current_user.employee.projects.build(project_params)
    if @project.save
      # @project.project_details.create(employee_id: current_user.id, project_id: @project.id)
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy

  end

  private

  def project_params
    # params.require(:project).permit(:description)
    params.require(:project).permit(:description, project_details_attributes: [:project_id, :employee_id])
  end
end
