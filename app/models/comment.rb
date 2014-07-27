# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text             not null
#  created_at       :datetime
#  updated_at       :datetime
#  commentable_id   :integer
#  commentable_type :string(255)
#  comments_by      :integer
#

class Comment < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :commentable, :polymorphic => true
  belongs_to :commenter, class_name: 'User', foreign_key: :comments_by, primary_key: :id
end
