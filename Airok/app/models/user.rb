class User < ApplicationRecord
  has_many :addresses
  has_one :cart	
  has_one :account
  has_one :accounthistory , :through => :account
end
