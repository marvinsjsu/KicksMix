# == Schema Information
#
# Table name: shoes
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      not null
#  category               :string(255)      not null
#  description            :text             not null
#  photo                  :string(255)      not null
#  created_at             :datetime
#  updated_at             :datetime
#  brand                  :string(255)
#  filepicker_url         :string(255)
#  photo_url_file_name    :string(255)
#  photo_url_content_type :string(255)
#  photo_url_file_size    :integer
#  photo_url_updated_at   :datetime
#

class Shoe < ActiveRecord::Base
  CATEGORIES = %w(casual formal running basketball tennis)
  validates :name, :category, :description, :photo, :brand, presence: true
  validates :name, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category" }
end
