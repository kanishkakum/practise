class Product < ApplicationRecord
	validate :title , :price, presence: true
	validate :price , numericality: true
	validate :title , uniqueness: true
end
