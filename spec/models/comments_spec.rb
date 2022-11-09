require 'rails_helper'
RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Anasse',
      bio: 'I am a front end developer',
      photo: 'http://www.example.com/photo.jpg',
      posts_counter: 0
    )
    @post = Post.create(
      author: @user,
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
    @comments = Comment.create(
      text: 'Coding is fun',
      author_id: @user.id,
      post_id: @post.id
    )
  end
  it '@commentss created should be valid' do
    expect(@comments).to be_valid
  end
  it '@commentss created should be valid' do
    @comments.text = 'Nice commentss makes your code looks good and descriptive'
    expect(@comments).to be_valid
  end
end
