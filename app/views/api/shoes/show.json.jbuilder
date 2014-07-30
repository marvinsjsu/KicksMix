json.ignore_nil! true
json.(@shoe, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo)
json.shoe_photo_sm @shoe.shoe_photo.url(:small)
json.shoe_photo_md @shoe.shoe_photo.url(:medium)
json.shoe_photo_lg @shoe.shoe_photo.url(:big)
json.author @shoe.author, :id, :username, :description
json.author_reviews @shoe.author.shoes, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo


json.matching_items @shoe.matching_items do |json, items|
  json.(items, :id, :user_id, :shoe_id, :description)
  json.mix_photo_sm items.mix_photo.url(:small)
  json.mix_photo_md items.mix_photo.url(:medium)
  json.mix_photo_lg items.mix_photo.url(:big)
end

json.liked_by @shoe.liked_by do |json, user|
  json.(user, :id, :username, :description, :photo_url, :email)
end


json.comments @shoe.comments do |json, comment|
  json.(comment, :id, :content, :comments_by, :commentable_id, :commentable_type, :created_at, :updated_at)
  json.(comment.commenter, :username, :photo_url, :description)

  json.partial! comment
end