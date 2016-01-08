class User < ActiveRecord::Base
  has_many :sounds, inverse_of: :user, dependent: :destroy

  has_many :followers, through: :follower_follows, source: :follower
  has_many :follower_follows, foreign_key: :leader_id, class_name: "Follow", dependent: :destroy
  has_many :leaders, through: :leader_follows, source: :leader
  has_many :leader_follows, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy

  has_secure_password
  validates :username, uniqueness: true, presence: true
end
