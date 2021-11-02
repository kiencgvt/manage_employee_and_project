class Employee < ApplicationRecord
  belongs_to :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :project_details, dependent: :destroy
  has_many :projects, through: :project_details
  belongs_to :user
end
