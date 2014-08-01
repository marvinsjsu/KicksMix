if Rails.env == "production"
    # set credentials from ENV hash
S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket => "*****"}
else
    # get credentials from YML file
    S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end