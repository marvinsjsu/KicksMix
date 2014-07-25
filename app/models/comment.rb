# == Schema Information
#
# Table name: comments
#
#  id      :integer          not null, primary key
#  user_id :integer          not null
#  shoe_id :integer          not null
#  content :text             not null
#

class Comment < ActiveRecord::Base
  belongs_to :shoe_review, class_name: 'Shoe', foreign_key: :shoe_id, primary_key: :id
  belongs_to :author, class_name: 'User', foreign_key: :user_id, primary_key: :id

end
