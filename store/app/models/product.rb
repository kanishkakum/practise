class Product < ApplicationRecord
	validates :title , :price, presence: true
	validates :price , numericality: true
	validates :title , uniqueness: true
end
