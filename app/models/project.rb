class Project < ApplicationRecord
  belongs_to :department, optional: true
  has_many :project_details
  has_many :employees, through: :project_details
  accepts_nested_attributes_for :project_details, reject_if: :all_blank, allow_destroy: true
  validates :description, presence: true , length: { maximum: 140 }

  LEADER = 3

  def leader
    employees.find { |e| e.user.role_id == LEADER }
  end

end
