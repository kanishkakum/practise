class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  has_many :addresses
  has_one :cart       
  has_one :account
  has_many :accounthistories, :through => :account

  before_create :Namecapitalize
  before_create :CategoryName

  private 
  def Namecapitalize
    self.name = self.name.capitalize
  end	

  def CategoryName
    self.contact = "+91" + self.contact if contact?
  end	
end
