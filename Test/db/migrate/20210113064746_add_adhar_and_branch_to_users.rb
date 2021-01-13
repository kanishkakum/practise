class AddAdharAndBranchToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :adhar_no, :integer
  end
end
