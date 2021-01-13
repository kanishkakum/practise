class Product < ApplicationRecord
  belongs_to :user
  validates :name , uniqueness: true
  validate :name_limit
  
  private

   def name_limit
    if name.length > 15
      errors.add(:name, “cannot be above than 15”)
    elsif name.length < 3
      errors.add(:name, “cannot be below than 3”)
    end
  end
end
