class AddDescriptionToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :description, :text
    add_column :products, :price, :decimal
    add_column :products, :make, :integer, default: 2015
  end
end
