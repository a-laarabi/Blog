# class CommentsController < ApplicationController
#   def new
#     @comment = Comment.new
#   end

#   def create
#     @comment = Comment.new(comment_params)
#     @comment.author_id = current_user.id
#     @post = Post.find(params[:post_id])
#     @comment.post_id = @post.id

#     if @comment.save
#       redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
#       flash[:notice] = 'Comment successfully added!'
#     else
#       render :new
#       flash[:alert] = 'Comment not submitted!'
#     end
#   end

#   def comment_params
#     params.require(:comment).permit(:text, :post_id)
#   end
# end

class CommentsController < ApplicationController
  def new
    @comment = Comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    # @comment = Comments.new(comment_params)
    @comments = Comments.new(
      author_id: current_user.id,
      post_id: @post.id,
      text: comment_params
    )

    @comments.save if @comments.valid?
    redirect_to user_post_path(current_user, @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end