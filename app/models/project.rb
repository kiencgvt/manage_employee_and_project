class Project < ApplicationRecord
  belongs_to :department, optional: true
  has_many :project_details
  has_many :employees, through: :project_details
  accepts_nested_attributes_for :project_details
  validates :description, presence: true , length: { maximum: 140 }


  def leader
    employees.find { |employee| employee.user.role.id == 3 }
  end

end
