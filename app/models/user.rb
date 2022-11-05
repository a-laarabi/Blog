class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :bio, presence: true, length: { minimum: 10, maximum: 160 }

  def recent_posts
    Post.last(3)
  end
end
