class User < ApplicationRecord
  has_many :likes
  has_many :posts
  has_many :comments

  # validates :name, presence: true
  # validates :bio, presence: true, length: { minimum: 10, maximum: 160 }

  def recent_posts
    Post.last(3)
  end
end
