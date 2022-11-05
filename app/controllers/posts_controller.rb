class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params[:id])
    @post.likes_counter = 0
    @post.comments_counter = 0
    
    respond_to do |format|
      if @post.save
        format.html do
          redirect_to user_posts_path(user_id: @post.author.id), notice: 'Post was successfully created.'
        end
      else
        format.html { render :new, alert: 'Error in creating post' }
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

