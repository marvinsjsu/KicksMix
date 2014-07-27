json.ignore_nil! true
json.(@shoe, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo)
json.author @shoe.author, :id, :username, :description
json.author_reviews @shoe.author.shoes, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo

json.comments @shoe.comments do |json, comment|
  json.(comment, :id, :content, :comments_by, :commentable_id, :commentable_type, :created_at, :updated_at)
  json.(comment.commenter, :username, :photo_url, :description)
end


