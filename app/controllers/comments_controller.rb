class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.owner = current_user
    if @comment.save
      flash[:notice] = 'Comment succesfully added'
      redirect_to posts_path
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
