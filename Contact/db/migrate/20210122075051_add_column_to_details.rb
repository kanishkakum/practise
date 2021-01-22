class AddColumnToDetails < ActiveRecord::Migration[6.0]
  def change
  	add_column :details, :city, :string
  	add_column :details, :zip, :integer
  	add_column :details, :state, :string
  	add_column :details, :adhar_no, :string

  end
end
