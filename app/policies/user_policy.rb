class UserPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || user.hr? || (user.leader? && User.where("role_id = ? && department_id = ?", 4, user.department_id)).include?(record) || user == record
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

end
