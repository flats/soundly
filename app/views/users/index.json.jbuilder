json.array!(@users) do |user|
  json.extract! user, :id, :username, :password_digest, :real_name, :bio, :image_url
  json.url user_url(user, format: :json)
end
