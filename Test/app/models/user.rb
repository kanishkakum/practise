class User < ApplicationRecord
  has_many :products	
  validates_associated :products
  validates :name, :adhar_no, presence: true
end
