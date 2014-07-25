class AddAttachmentShoePhotoToShoes < ActiveRecord::Migration
  def self.up
    change_table :shoes do |t|
      t.attachment :shoe_photo
    end
  end

  def self.down
    remove_attachment :shoes, :shoe_photo
  end
end
