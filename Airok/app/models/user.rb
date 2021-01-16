class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable	
  has_many :addresses
  has_one :cart	
  has_one :account
  has_many :categories , :through => :products

end
