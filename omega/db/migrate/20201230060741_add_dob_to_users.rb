class AddDobToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Date_of_birth, :datetime
  end
end
