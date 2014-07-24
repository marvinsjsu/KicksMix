class AddNameOfAttributeForFilepickerUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :filepicker_url, :string
    add_column :shoes, :filepicker_url, :string
  end
end
