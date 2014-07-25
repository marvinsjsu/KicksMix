class AddTimestampShoes < ActiveRecord::Migration
  def change
    add_column(:shoes, :created_at, :datetime)
    add_column(:shoes, :updated_at, :datetime)
  end
end
