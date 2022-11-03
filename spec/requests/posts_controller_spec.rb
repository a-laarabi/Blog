require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe "GET './index' page" do
    before(:all) do
      @address = get '/users/:id/posts'
    end

    it 'it should return a valid status' do
      expect(@address).to eq(200)
    end
  
    it 'it should render the actual template correctly' do
      expect(get('/users/:id/posts')).to render_template('posts/index')
    end
  end

  describe "GET './show' page" do
    before(:all) do
      @address = get '/users/:id/posts'
    end

    it 'it should return a valid status' do
      expect(@address).to eq(200)
    end

    it 'The response body should have the correct placeholder text' do
      expect(response.body).to include(' <h1>All the posts</h1>')
    end
  end
end
