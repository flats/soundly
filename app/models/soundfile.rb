class Soundfile < ActiveRecord::Base
  belongs_to :sound
  include Attachable
  before_destroy :destroy_soundfile

  def destroy_soundfile
    delete_attached_file
  end
end
