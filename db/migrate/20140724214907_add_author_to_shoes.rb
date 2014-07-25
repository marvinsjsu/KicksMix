class AddAuthorToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :author_id, :integer
  end
end
