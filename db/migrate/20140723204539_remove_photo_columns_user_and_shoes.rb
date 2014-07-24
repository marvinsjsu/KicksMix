class RemovePhotoColumnsUserAndShoes < ActiveRecord::Migration
  def change
    remove_column :users, :photo
    remove_column :shoes, :photo_url
  end
end
