class AddBrandToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :brand, :string
  end
end
