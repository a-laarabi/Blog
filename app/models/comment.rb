class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_comments_counter

  validates :text, presence: true

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
