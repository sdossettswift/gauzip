class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  has_many :posts
  acts_as_follower
  acts_as_followable
end
