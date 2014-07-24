class AddPhotoUrlAndDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :photo_url, :string
  end
end
