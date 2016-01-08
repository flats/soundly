module Attachable
  require 'fileutils'
  # Adapted from Paperclip: returns the id of the instance in a
  # split path form, e.g. returns 000/001/234 for an id of 1234.
  def id_partition
    ("%09d".freeze % self.id).scan(/\d{3}/).join("/".freeze)
  end

  def file_path
    UPLOAD_DIR + id_partition + "/".freeze + self.soundfile
  end

  def public_file_path
    UPLOAD_DIR.gsub("public/", "") + id_partition + "/".freeze + self.soundfile
  end

  def write_attached_file(tempfile:)
    make_directories
    File.open(file_path, "w") do |f|
      f.write(tempfile.read)
    end
  end

  def delete_attached_file
    File.delete(file_path) if File.exist?(file_path)
  end

  def mime_type
    `file --brief --mime-type "#{self.file_path}"`.strip
  end

  private
  def make_directories
    FileUtils.mkdir_p(UPLOAD_DIR + id_partition)
  end
end