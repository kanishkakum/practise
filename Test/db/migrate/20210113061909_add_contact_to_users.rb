class AddContactToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :contact_no, :integer
  end
end
