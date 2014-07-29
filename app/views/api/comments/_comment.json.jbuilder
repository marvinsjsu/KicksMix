json.comments comment.comments do |json, comm|
  json.(comm, :id, :content, :comments_by, :commentable_id, :commentable_type, :created_at, :updated_at)
  json.(comm.commenter, :username, :photo_url, :description)
  json.partial! comm
end