class ChangeCityToBeStringInUsers < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :city, :string
  end
end
