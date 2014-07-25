class AddShoePhoto < ActiveRecord::Migration
  def change
    add_column :shoes, :shoe_photo, :string
  end
end
