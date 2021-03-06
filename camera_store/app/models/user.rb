class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_one :cart       
  scope :z, -> () {find(4).cart.products.where(category_id: Category.where(name: 'nikon'))}



end
