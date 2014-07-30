json.liked_by @shoe.liked_by do |json, like|
  json.(like, :id, :username, :description, :email, :photo_url, :created_at, :updated_at)
  json.photo_url_sm like.photo_url.url(:small)
  json.photo_url_md like.photo_url.url(:medium)
  json.photo_url_lg like.photo_url.url(:big)

  json.shoe_likes like.liked_shoes do |json, other_shoe|
    json.(other_shoe, :id, :name, :review)
    json.shoe_photo_sm other_shoe.shoe_photo.url(:small)
    json.shoe_photo_md other_shoe.shoe_photo.url(:medium)
    json.shoe_photo_lg other_shoe.shoe_photo.url(:big)
  end
end

json.success 'true'

