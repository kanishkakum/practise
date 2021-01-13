class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Income, :integer, default: 0000
  end
end
