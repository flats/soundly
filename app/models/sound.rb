class Sound < ActiveRecord::Base
  belongs_to :user, inverse_of: :sounds
  has_one :soundfile, dependent: :destroy
  validates :title, presence: true
end