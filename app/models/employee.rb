class Employee < ApplicationRecord
  belongs_to :profile
  belongs_to :role
  belongs_to :department
  has_many :project_details
  has_many :projects, through: :project_details
end
