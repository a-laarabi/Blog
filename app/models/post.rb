class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :update_posts_counter

  # validates :title, presence: true, length: { in: 3..250 }
  # validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :DESC).limit(5)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end