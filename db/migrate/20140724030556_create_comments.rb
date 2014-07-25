class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :shoe_id, null: false
      t.text :content, null: false
    end
    add_index :comments, [:user_id, :shoe_id]
  end
end
