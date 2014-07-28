#json.array! @commentable.comments


#json.(@commentable.comments[0].commenter, :username, :photo_url, :description)

# json.comments @commentable.comments do |json, comment|
#   json.(comment, :content, :comments_by, :commentable_id, :commentable_type, :created_at, :updated_at)
#   json.(comment.commenter, :username, :photo_url, :description)
# end

json.(@commentable.comments.last, :id, :content, :commentable_id, :commentable_type)
json.(@commentable.comments.last.commenter, :username, :description, :photo_url)
json.success 'true'
