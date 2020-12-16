class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :Name
      t.text :Description
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
