class AddBooleanToNewcolumn < ActiveRecord::Migration[6.0]
  def change
  	add_column :products, :delete, :boolean, :null=>true
  end
end
