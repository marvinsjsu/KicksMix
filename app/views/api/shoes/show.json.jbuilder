json.(@shoe, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo)
json.author @shoe.author, :id, :username, :description
json.author_reviews @shoe.author.shoes, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo

json.comments @shoe.comments do |json, comment|
  json.(comment, :id, :user_id, :shoe_id, :content)
  json.author comment.author, :id, :username
end

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
