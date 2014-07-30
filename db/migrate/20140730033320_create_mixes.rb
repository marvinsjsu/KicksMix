class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.integer :user_id, null: false
      t.integer :shoe_id, null: false
      t.text :description

      t.timestamps
    end
    add_index :mixes, [:user_id, :shoe_id]
  end
end
