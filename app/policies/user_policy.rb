class UserPolicy < ApplicationPolicy
  def destroy?
    user.admin?
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || user == record
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

end
