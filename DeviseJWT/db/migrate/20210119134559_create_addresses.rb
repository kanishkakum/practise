class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.text :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
