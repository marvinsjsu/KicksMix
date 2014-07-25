class AddReviewColumnToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :review, :text
  end
end
