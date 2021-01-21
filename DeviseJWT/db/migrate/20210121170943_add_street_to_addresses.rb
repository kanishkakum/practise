class AddStreetToAddresses < ActiveRecord::Migration[6.0]
  def change
  	add_column :addresses, :street2, :text
  end
end
