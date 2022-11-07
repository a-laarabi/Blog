class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(
      author_id: current_user.id,
      post_id: @post.id,
      text: comment_params
    )

    if @comment.save
      redirect_to user_posts_path(user_id: @comment.post_id), notice: 'Success!'
    else
      render :new, alert: 'Error Occurred'
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy!
    @post.save
    flash[:success] = 'You have deleted this comment!'
    redirect_to user_path(current_user.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
