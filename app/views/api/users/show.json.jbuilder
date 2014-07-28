json.(@user, :id, :username, :email, :description, :created_at, :updated_at, :photo_url, :role)

json.comments @user.comments do |json, comment|
  json.(comment, :id, :content, :commentable_id, :commentable_type, :created_at)
  json.commenter comment.commenter, :id, :username, :email, :description, :created_at, :updated_at, :photo_url, :role
end

json.my_comments @user.my_comments do |json, comment|
  json.(comment, :id, :content, :commentable_id, :commentable_type, :created_at)
end