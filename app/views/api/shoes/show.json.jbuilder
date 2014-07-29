json.ignore_nil! true
json.(@shoe, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo)
json.author @shoe.author, :id, :username, :description
json.author_reviews @shoe.author.shoes, :id, :name, :category, :review, :price, :brand, :created_at, :updated_at, :shoe_photo

json.comments @shoe.comments do |json, comment|
  json.(comment, :id, :content, :comments_by, :commentable_id, :commentable_type, :created_at, :updated_at)
  json.(comment.commenter, :username, :photo_url, :description)

  json.partial! comment

  # json.comments comment.comments do |json, comm|
  #   json.(comm, :id, :content, :comments_by, :commentable_id, :commentable_type, :created_at, :updated_at)
  #   json.(comm.commenter, :username, :photo_url, :description)
  #
  #   json.comments comm.comments do |json, com|
  #     json.(com, :id, :content, :comments_by, :commentable_id, :commentable_type, :created_at, :updated_at)
  #     json.(com.commenter, :username, :photo_url, :description)
  #   end
  # end
end