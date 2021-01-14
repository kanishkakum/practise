class Product < ApplicationRecord
  belongs_to :user
  validates :name , uniqueness: true
  validate :name_limit
  validate :Remove_space_from_name
  
  private

   def name_limit
     if name.length > 15
       errors.add(:name, "cannot be above than 15")  
     elsif name.length < 3
       errors.add(:name, "cannot be below than 3")
     end
   end

   def Remove_space_from_name()
     if name.include?(' ')
       name.gsub(' ','')
     end  
         
   end
end
