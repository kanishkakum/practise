class Product < ApplicationRecord
  validates :title , :price, presence: true
  validates :price , numericality: true
  validates :title , uniqueness: true , format: { with:  /\A[a-zA-Z]+\z/ }
  validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\z}i }

  validate :title_limits

  private
  def title_limits
     if title.length > 20
      errors.add(:title, "cannot be above 20 letters")
    elsif title.length < 5
      errors.add(:title, "cannot be below 5 letters")
    end
  end  



  def self.search(search)
	if search
	   where(["title LIKE ?","%#{search}%"])
	else
	  @products = Product.all
    end
  end  
end 
