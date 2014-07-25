# == Schema Information
#
# Table name: shoes
#
#  id                      :integer          not null, primary key
#  name                    :string(255)      not null
#  category                :string(255)      not null
#  review                  :text             not null
#  price                   :float            not null
#  brand                   :string(255)      not null
#  created_at              :datetime
#  updated_at              :datetime
#  shoe_photo_file_name    :string(255)
#  shoe_photo_content_type :string(255)
#  shoe_photo_file_size    :integer
#  shoe_photo_updated_at   :datetime
#  shoe_photo              :string(255)
#  author_id               :integer
#

class Shoe < ActiveRecord::Base

  has_attached_file :shoe_photo, :styles => {
     :big => "600x600>",
     :small => "70x70#",
     :medium => "200x200"
  }

  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :shoe_photo, :content_type => /\Aimage\/.*\Z/


  validates :name, :category, :price, :brand, :review, presence: true
  validates :name, uniqueness: true

  has_many :comments, class_name: 'Comment', foreign_key: :shoe_id, primary_key: :id
  belongs_to :author, class_name: 'User', foreign_key: :author_id, primary_key: :id
end
