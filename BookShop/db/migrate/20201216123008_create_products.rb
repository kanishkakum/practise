class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :Title
      t.text :description
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
