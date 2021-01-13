class User < ApplicationRecord
  has_many :products	
  validates_associated :products
  validates :name, :adhar_no, presence: true
  validates :email, format: {with: /[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]/, message: "string , numeric and special symbols are allowed" }
  validates :email, uniqueness: true
  validates :salary, numericality: true
end
