class AddBooleanToNewcolumn < ActiveRecord::Migration[6.0]
  def change
  	add_column :products, :deleted, :boolean, :null=>true, :default=>false
  end
end
