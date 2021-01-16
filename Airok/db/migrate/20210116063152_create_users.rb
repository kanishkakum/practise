class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :contact
      t.string :email_id
      t.string :gender
      t.string :password

      t.timestamps
    end
  end
end
