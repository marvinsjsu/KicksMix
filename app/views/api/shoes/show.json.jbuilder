json.(@shoe, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo)
json.author @shoe.author, :id, :username, :description
json.author_reviews @shoe.author.shoes, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo

json.comments @shoe.comments do |json, comment|
  json.(comment, :id, :user_id, :shoe_id, :content)
  json.author comment.author, :id, :username
end

