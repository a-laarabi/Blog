require 'rails_helper'

RSpec.describe 'User show page' do
  before :each do
    @user1 = User.create(
      name: 'Anasse',
      bio: 'I am a front end developer',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      posts_counter: 0
    )

    # add five posts for the user
    5.times do |i|
      Post.create(author: @user1,
                  title: 'My first post',
                  text: "This is my #{i} post",
                  comments_counter: 2,
                  likes_counter: 9)
    end
  end

  it 'displays the correct username' do
    visit user_path(@user1)

    expect(page).to have_content('Anasse')
  end

  it 'displays the correct photo' do
    visit user_path(@user1)

    expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'displays number of posts' do
    visit user_path(@user1)

    expect(page).to have_content("Number of Posts: #{@user1.posts_counter}")
  end

  it 'displays the correct posts' do
    visit user_path(@user1)

    expect(page).to have_content('My first post')
  end

  it 'displays the bio' do
    visit user_path(@user1)

    expect(page).to have_content('I am a front end developer')
  end

  it 'displays button to see all posts' do
    visit user_path(@user1)

    expect(page).to have_link('See all posts')
  end

  it 'redirects to the posts index page when the button is clicked' do
    visit user_path(@user1)

    click_link('See all posts')

    expect(page).to have_current_path(user_posts_path(@user1))
  end

  it 'displays the correct number of comments' do
    visit user_path(@user1)

    expect(page).to have_content('Comments: 2')
  end

  it 'displays the correct number of likes' do
    visit user_path(@user1)

    expect(page).to have_content('Likes: 9')
  end
end
