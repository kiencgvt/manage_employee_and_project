class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.employee.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      @projects = current_user.employee.projects.order(id: :desc).paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    ProjectDetail.where("project_id = ? and employee_id = ?", params[:id], current_user.employee.id).destroy_all
    flash[:success] = "Project deleted"
    redirect_to root_url
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Project updated!"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, project_details_attributes: [:id, :project_id, :employee_id])
  end
end
