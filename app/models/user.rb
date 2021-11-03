class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :employee, dependent: :destroy
  belongs_to :role
  belongs_to :department, optional: true
  accepts_nested_attributes_for :employee

  ADMIN_ID = 1
  HR_ID = 2
  LEADER_ID = 3
  EMPLOYEE_ID = 4

  def admin?
    role_id == ADMIN_ID
  end

  def hr?
    role_id == HR_ID
  end

  def leader?
    role_id == LEADER_ID
  end

  def employee?
    role_id == EMPLOYEE_ID
  end

end
