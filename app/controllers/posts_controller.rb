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
    authorize @post
    if @post.save
      flash[:notice] = 'Post succesfully added'
      redirect_to posts_path
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      flash[:notice] = 'Post succesfully updated'
      redirect_to posts_path
    else
      flash[:danger] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
