class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.text :description, null: false
      t.string :photo, null: false

      t.timestamps
    end
    add_index :shoes, :name, unique: true
  end
end
