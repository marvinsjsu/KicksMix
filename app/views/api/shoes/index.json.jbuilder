json.shoes @shoes.each do |json, shoe|

 json.(shoe, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo, :author_id)
 json.author shoe.author, :id, :username, :description, :created_at

 json.comments shoe.comments do |json, comment|
   json.(comment, :content, :comments_by)
   json.(comment.commenter, :id, :username, :photo_url, :description)
 end

end
