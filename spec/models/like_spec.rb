require 'rails_helper'
RSpec.describe Post, type: :model do
  before(:all) do
    @user1 = User.create(
      name: 'Anasse',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I am a front end developer',
      posts_counter: 0
    )
    @post = Post.create(
      author_id: @user1.id
    )
    @like = Like.create(
      author_id: @user1.id,
      post_id: 1
    )
  end
  it '@like created should be valid' do
    expect(@like).to_not be_valid
  end
  it '@like created should not have user' do
    @like.author_id = nil
    expect(@like).to_not be_valid
  end
end
