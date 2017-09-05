class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.owner = current_user
    if @post.save
      flash[:notice] = 'Post succesfully added'
      redirect_to posts_path
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
