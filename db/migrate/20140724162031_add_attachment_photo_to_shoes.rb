class AddAttachmentPhotoToShoes < ActiveRecord::Migration
  def self.up
    change_table :shoes do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :shoes, :photo
  end
end
