require 'rails_helper'

# Test the users index page using integration tests

RSpec.describe 'Users index page', type: :feature do
  before :each do

    @user1 = User.create(
      name: 'Lilly',
      bio: 'Teacher from Mexico.',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      posts_counter: 0
    )

    @user2 = User.create(
      name: 'Tom',
      bio: 'Teacher from Poland.',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      posts_counter: 0
    )
  end

  it 'displays all users' do
    visit users_path
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Tom')
  end

  it 'displays all users profile photo' do
    visit users_path
    expect(page).to have_css('img[src="https://unsplash.com/photos/F_-0BxGuVvo"]')
  end

  it 'displays number of posts' do
    visit users_path
    expect(page).to have_content('0')
  end

  it 'after clicking on a user, the user profile page is displayed' do
    visit users_path
    click_link @user1.name
    expect(page).to have_current_path user_path(@user1)
  end
end