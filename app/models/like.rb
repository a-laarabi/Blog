class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id', class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
