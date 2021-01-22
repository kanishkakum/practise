class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :contact_no
      t.text :street
      t.string :gender

      t.timestamps
    end
  end
end
