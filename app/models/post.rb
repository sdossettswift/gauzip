class Post < ApplicationRecord
  belongs_to :user
  validates :message, presence: true
  validates :user, presence: true
end
