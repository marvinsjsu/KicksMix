class CreateShoesAgain < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.float :price
      t.string :brand, null: false
      t.text :review, null: false
    end
    add_index :shoes, :name, unique: true
  end
end
