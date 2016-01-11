class Soundfile < ActiveRecord::Base
  belongs_to :sound
  include Attachable
  before_destroy :destroy_soundfile

  def replace_soundfile(uploaded_file)
    delete_attached_file
    self.update(file_name: uploaded_file.original_filename,
                content_type: uploaded_file.content_type)
    write_attached_file(tempfile: uploaded_file.tempfile)
  end

  def destroy_soundfile
    delete_attached_file
  end
end
