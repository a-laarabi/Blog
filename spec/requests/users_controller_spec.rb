require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user =
      User.create(
        name: 'Agnes',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'I am an archaeologist from Australia. I just love digging.',
        posts_counter: 2
      )
  end

  context 'GET #index' do
    before(:each) { get users_path }

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end
  end
end
