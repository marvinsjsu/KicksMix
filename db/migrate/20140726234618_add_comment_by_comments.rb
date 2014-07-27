class AddCommentByComments < ActiveRecord::Migration
  def change
    add_column :comments, :comments_by, :integer
  end
end
