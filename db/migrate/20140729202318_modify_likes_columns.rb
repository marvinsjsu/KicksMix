class ModifyLikesColumns < ActiveRecord::Migration
  def change
    add_index :likes, [:user_id, :shoe_id], unique: true
  end
end
