json.likedBy @shoe.liked_by do |json, like|
  json.(like, :id, :username, :description, :email, :photo_url, :created_at, :updated_at)
  json.photo_url_sm like.photo_url.url(:small)
  json.photo_url_md like.photo_url.url(:medium)
  json.photo_url_lg like.photo_url.url(:big)
end

json.success 'true'

