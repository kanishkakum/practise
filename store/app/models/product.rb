class Product < ApplicationRecord
  validates :title , :price, presence: true
  validates :price , numericality: true
  validates :title , uniqueness: true

  def self.search(search)
	if search
	   where(["title LIKE ?","%#{search}%"])
	else
	  @products = Product.all
    end
  end  
end 
