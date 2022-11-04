class PostsController < ApplicationController
  def index
    puts params
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params[:id])

    if @post.save
      redirect_to users_path(id: @post.users_id)
    else
      render :new, status: :unprocessable_entity
      # redirect_to users_path(id: @post.users_id)
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

