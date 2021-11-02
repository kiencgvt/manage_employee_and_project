class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :employee, dependent: :destroy
  belongs_to :role
  belongs_to :department
  accepts_nested_attributes_for :employee
end
