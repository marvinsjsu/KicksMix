class ModifyLikes < ActiveRecord::Migration
  def change
    change_column :likes, :shoe_id, :integer, null: true
    change_column :likes, :user_id, :integer, null: true
  end
end
