json.comments @comments.each do |json, comment|
  json.(comment, :id, :content, :comments_by, :commentable_id, :commentable_type, :created_at, :updated_at)
  json.(comment.commenter, :username, :photo_url, :description)
end