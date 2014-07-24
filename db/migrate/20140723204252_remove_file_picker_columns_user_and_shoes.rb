class RemoveFilePickerColumnsUserAndShoes < ActiveRecord::Migration
  def change
    remove_column :users, :filepicker_url
    remove_column :users, :filepicker_url
  end
end
