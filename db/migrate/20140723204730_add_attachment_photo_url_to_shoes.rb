class AddAttachmentPhotoUrlToShoes < ActiveRecord::Migration
  def self.up
    change_table :shoes do |t|
      t.attachment :photo_url
    end
  end

  def self.down
    remove_attachment :shoes, :photo_url
  end
end
