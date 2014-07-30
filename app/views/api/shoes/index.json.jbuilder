json.shoes @shoes.each do |json, shoe|

 json.(shoe, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo, :author_id)
 json.author shoe.author, :id, :username, :description, :created_at
 json.shoe_photo_sm shoe.shoe_photo.url(:small)
 json.shoe_photo_md shoe.shoe_photo.url(:medium)
 json.shoe_photo_lg shoe.shoe_photo.url(:big)
 json.comments shoe.comments do |json, comment|
   json.(comment, :content, :comments_by)
   json.(comment.commenter, :username, :photo_url, :description)
 end

end
