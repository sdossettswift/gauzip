class User < ApplicationRecord
  acts_as_follower
  acts_as_followable
  has_secure_password
  validates :username, presence: true
  has_many :posts, dependent: :destroy
end
