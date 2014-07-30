json.shoes @shoes.each do |json, shoe|

 json.(shoe, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo, :author_id)
 json.author shoe.author, :id, :username, :description, :created_at
 json.shoe_photo_sm shoe.shoe_photo.url(:small)
 json.shoe_photo_md shoe.shoe_photo.url(:medium)
 json.shoe_photo_lg shoe.shoe_photo.url(:big)

  json.matching_items shoe.matching_items do |json, items|
    json.(items, :id, :user_id, :shoe_id, :description)
    json.mix_photo_sm items.mix_photo.url(:small)
    json.mix_photo_md items.mix_photo.url(:medium)
    json.mix_photo_lg items.mix_photo.url(:big)
  end

 json.comments shoe.comments do |json, comment|
   json.(comment, :content, :comments_by)
   json.(comment.commenter, :username, :photo_url, :description)
 end


  json.liked_by shoe.liked_by do |json, like|
    json.(like, :id, :username, :description, :email, :photo_url, :created_at, :updated_at)
    json.photo_url_sm like.photo_url.url(:small)
    json.photo_url_md like.photo_url.url(:medium)
    json.photo_url_lg like.photo_url.url(:big)
  end
end
