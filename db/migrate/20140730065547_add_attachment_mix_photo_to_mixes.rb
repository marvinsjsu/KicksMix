class AddAttachmentMixPhotoToMixes < ActiveRecord::Migration
  def self.up
    change_table :mixes do |t|
      t.attachment :mix_photo
    end
  end

end
