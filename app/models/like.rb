# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  shoe_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Like < ActiveRecord::Base
  validates :user_id, :shoe_id, presence: true
  belongs_to :liked_by, class_name: 'User', foreign_key: :user_id, primary_key: :id
  belongs_to :item_liked, class_name: 'Shoe', foreign_key: :shoe_id, primary_key: :id
end
