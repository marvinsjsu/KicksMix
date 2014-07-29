class AddTagLinetoShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :tag_line, :string
  end
end
