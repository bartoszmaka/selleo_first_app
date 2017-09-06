class PostsController < ApplicationController
  before_action { authorize Post }

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
end
