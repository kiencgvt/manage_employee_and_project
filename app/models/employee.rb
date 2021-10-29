class Employee < ApplicationRecord
  belongs_to :profile, dependent: :destroy
  belongs_to :department, optional: true
  has_many :project_details, dependent: :destroy
  has_many :projects, through: :project_details
  belongs_to :user
end
