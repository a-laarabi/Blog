require 'rails_helper'
RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Ambrose',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I am a preacher of CHRIST',
      posts_counter: 0
    )
    @comments = Comments.create(
      text: 'Coding is fun',
      author_id: @user.id,
      post_id: 1
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
