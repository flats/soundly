json.array!(@sounds) do |sound|
  json.extract! sound, :id, :title, :user_id
  json.url sound_url(sound, format: :json)
end
