class Product < ApplicationRecord
  validates :title , :price, :image_url, :description, presence: true
  validates :price , numericality: true
  validates :title , uniqueness: true , format: { :with => /\A[a-zA-Z]+\z/ }
  validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\z}i }

  def self.search(search)
	if search
	   where(["title LIKE ?","%#{search}%"])
	else
	  @products = Product.all
    end
  end  
end 
