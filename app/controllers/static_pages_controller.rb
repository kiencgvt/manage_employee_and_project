class StaticPagesController < ApplicationController
  def home
    @project = current_user.employee.projects.build if user_signed_in?
  end

  def help
  end
end
