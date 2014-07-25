class AddPhotoUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photo_url, :string
    add_column :shoes, :shoe_photo, :string
  end
end
