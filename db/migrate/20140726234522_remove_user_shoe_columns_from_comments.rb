class RemoveUserShoeColumnsFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :shoe_id
    remove_column :comments, :user_id
  end
end
