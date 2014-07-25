class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
        t.string   "name",                    null: false
        t.string   "category",                null: false
        t.text     "review",                  null: false
        t.float    "price",                   null: false
        t.string   "brand",                   null: false
        t.integer  "author_id"
        t.timestamps
    end
    add_index :shoes, :name, unique: true
  end
end