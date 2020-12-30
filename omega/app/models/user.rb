class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:email, :username]

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
 
  validates :username, presence:true, uniqueness: true

 

end
