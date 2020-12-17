class AddBooleanToNewcolumn < ActiveRecord::Migration[6.0]
  def change
  	change_column :products, :delete, :boolean, :null=>true, :default=>false
  end
end
