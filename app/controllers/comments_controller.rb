class CommentsController < ApplicationController

  def new
    authorize Comment
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.owner = current_user
    authorize @comment
    if @comment.save
      flash[:notice] = 'Comment succesfully added'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update(comment_params)
      flash[:notice] = 'Comment succesfully added'
    else
      flash[:danger] = 'Something went wrong'
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
