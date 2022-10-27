class User < ApplicationRecord
  has_many :likes, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'
  has_many :comments

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :bio, presence: true, length: { minimum: 10, maximum: 160 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end