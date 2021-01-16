class CreateAccounthistories < ActiveRecord::Migration[6.0]
  def change
    create_table :accounthistories do |t|
      t.references :account, null: false, foreign_key: true
      t.integer :credit_rating

      t.timestamps
    end
  end
end
