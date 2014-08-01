json.(@user, :id, :username, :email, :description, :created_at, :updated_at, :photo_url, :role)

json.comments @user.comments do |json, comment|
  json.(comment, :id, :content, :commentable_id, :commentable_type, :created_at)
  json.commenter comment.commenter, :id, :username, :email, :description, :created_at, :updated_at, :photo_url, :role
end

json.my_comments @user.my_comments do |json, comment|
  json.(comment, :id, :content, :commentable_id, :commentable_type, :created_at)
end

json.liked_shoes @user.liked_shoes do |json, liked|
  json.(liked, :id, :name, :category, :review, :price, :brand, :shoe_photo)
  json.shoe_photo_sm liked.shoe_photo.url(:small)
  json.shoe_photo_md liked.shoe_photo.url(:medium)
  json.shoe_photo_lg liked.shoe_photo.url(:big)
end

json.my_shoes @user.shoes do |json, shoe|
  json.(shoe, :id, :name, :category, :review, :price, :brand, :shoe_photo)
  json.shoe_photo_sm shoe.shoe_photo.url(:small)
  json.shoe_photo_md shoe.shoe_photo.url(:medium)
  json.shoe_photo_lg shoe.shoe_photo.url(:big)


  json.liked_by shoe.liked_by do |json, person|
    json.(person, :id, :username, :email, :description, :created_at, :updated_at, :photo_url, :role)
  end

  json.matching_items shoe.matching_items do |json, item|
    json.(item, :id, :description, :mix_photo)
    json.mix_photo_sm item.mix_photo.url(:small)
    json.mix_photo_md item.mix_photo.url(:medium)
    json.mix_photo_lg item.mix_photo.url(:big)
  end

  json.comments shoe.comments do |json, comment|
    json.(comment, :content)
    json.(comment.commenter, :id, :username, :email, :description, :photo_url)
    json.photo_url_sm comment.commenter.photo_url.url(:small)
    json.photo_url_md comment.commenter.photo_url.url(:medium)
    json.photo_url_lg comment.commenter.photo_url.url(:big)
  end
end