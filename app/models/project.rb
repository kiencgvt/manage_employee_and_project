class Project < ApplicationRecord
  belongs_to :department
  has_many :project_details
  has_many :employees, through: :project_details
end
