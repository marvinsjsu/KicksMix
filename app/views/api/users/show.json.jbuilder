json.(@user, :id, :username, :email, :description, :created_at, :updated_at, :photo_url, :role)

json.comments @user.comments do |json, comment|
  json.(comment, :id, :content, :commentable_id, :commentable_type, :created_at)
  json.commenter comment.commenter, :id, :username, :email, :description, :created_at, :updated_at, :photo_url, :role
end

json.my_comments @user.my_comments do |json, comment|
  json.(comment, :id, :content, :commentable_id, :commentable_type, :created_at)
end

json.my_shoes @user.shoes do |json, shoe|
  json.(shoe, :id, :name, :category, :review, :price, :brand, :shoe_photo)
  json.shoe_photo_sm shoe.shoe_photo.url(:small)
  json.shoe_photo_md shoe.shoe_photo.url(:medium)
  json.shoe_photo_lg shoe.shoe_photo.url(:big)


  json.liked_by shoe.liked_by do |json, person|
    json.(person, :id, :username, :email, :description, :created_at, :updated_at, :photo_url, :role)
  end
end

