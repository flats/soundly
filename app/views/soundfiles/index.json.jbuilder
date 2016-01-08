json.array!(@soundfiles) do |soundfile|
  json.extract! soundfile, :id, :sound_id, :file_name, :content_type, :file_size
  json.url soundfile_url(soundfile, format: :json)
end
