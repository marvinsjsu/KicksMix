class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :shoe_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :likes, [:shoe_id, :user_id]
  end
end
