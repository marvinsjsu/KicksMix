class AddAttachmentPhotoUrlToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :photo_url
    end
  end

  def self.down
    remove_attachment :users, :photo_url
  end
end
