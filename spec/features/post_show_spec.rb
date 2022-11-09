require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Anasse',
      bio: 'I am a front end developer',
      photo: 'http://www.example.com/photo.jpg',
      posts_counter: 0
    )
    @post = Post.create(
      author: @user1,
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'This is the 1st comment on the 4th post')
    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'This is the 2st comment on the 4th post')
    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'This is the 3st comment on the 4th post')
    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'This is the 4th comment on the 4th post')
    Like.create(post_id: @post.id, author_id: @user1.id)
    visit user_post_path(@user1, @post)
  end

  it 'I can see who wrote the post' do
    expect(page).to have_content(@user1.name)
  end

  it 'shows number of comments a post has' do
    expect(page.body).to include('Comment 4,  ')
  end

  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes 1')
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@post.title)
  end
end
