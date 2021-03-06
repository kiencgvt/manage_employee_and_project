class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def show
    @project = Project.find(params[:id])
    @project_detail = @project.project_details.new
    # @employees = User.where("department_id = ?", @project.department_id).employee
    @employees = Employee.joins(:user).merge(User.where("role_id = ? and department_id = ?", 4, @project.department_id))
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
    ProjectDetail.find_by("project_id = ? and employee_id = ?", params[:id], current_user.employee.id).destroy
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

  def destroy_employee_from_project
    ProjectDetail.find_by("employee_id = ? and project_id = ?", params[:id_e], params[:id_p]).destroy
    flash[:success] = "Employee removed from the project"
    if Project.find(params[:id_p]).leader.nil?
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def add_employee_to_project
    @project = Project.find(params[:id])
    @project_detail = @project.project_details.new(project_detail_params)
    if @project_detail.save
      flash[:success] = "Add employee to the project"
    else
      flash[:danger] = "Employee already in the project"
    end
    redirect_to request.referrer || root_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :department_id, :start_date, :end_date, project_details_attributes: [:id, :project_id, :employee_id])
  end

  def project_detail_params
    params.require(:project_detail).permit(:employee_id, :project_id)
  end
end
