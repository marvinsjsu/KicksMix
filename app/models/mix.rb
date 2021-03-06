# == Schema Information
#
# Table name: mixes
#
#  id                     :integer          not null, primary key
#  user_id                :integer          not null
#  shoe_id                :integer          not null
#  description            :text
#  created_at             :datetime
#  updated_at             :datetime
#  mix_photo              :string(255)      not null
#  mix_photo_file_name    :string(255)
#  mix_photo_content_type :string(255)
#  mix_photo_file_size    :integer
#  mix_photo_updated_at   :datetime
#

class Mix < ActiveRecord::Base

  has_attached_file :mix_photo, :styles => {
    :big => "600x600>",
    :small => "70x70#",
    :medium => "200x200"
  }

  validates_attachment :mix_photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


  validates :user_id, :shoe_id, presence: true
  belongs_to :recommender, class_name: "User", foreign_key: :user_id, primary_key: :id
  belongs_to :matching_shoe, class_name: "Shoe", foreign_key: :shoe_id, primary_key: :id
end
