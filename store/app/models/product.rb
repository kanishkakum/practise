class Product < ApplicationRecord
  validates :title , :price, presence: true
  validates :price , numericality: true
  validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\z}i }

  validate :title_limits

  before_validation :give_default_name

  before_save :titleupcase

  def give_default_name
    self.title = 'default' if title.blank?
  end


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

  def titleupcase
    self.title = self.title.upcase
  end   
end 
