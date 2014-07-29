json.likedBy @shoe.liked_by do |json, like|
  json.(like, :id, :username, :description, :email, :photo_url, :created_at, :updated_at)
end

json.success 'true'

