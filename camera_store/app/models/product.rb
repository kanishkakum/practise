class Product < ApplicationRecord
  belongs_to :category
  #belongs_to :user
  has_and_belongs_to_many :carts

  scope :min_price, -> () {where("price > 50000")}
  scope :x, -> () {where(category_id: 2)}
  scope :y, -> () {where(category_id: Category.where(name: 'nikon'))}
  scope :b, -> () {where(id: [1,2,3,4])}
  scope :price_less_than, -> (amount) {where("price > ?", amount)}

  before_save :inc_price

  before_create :add_description

  before_update :downcase
  
  def inc_price
  	self.price = price*1.20
  end	

  def add_description
  	self.description = "Digital Camera"
  end	

  def downcase
    self.name = self.name.downcase
  end  


end
