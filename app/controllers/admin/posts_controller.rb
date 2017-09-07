module Admin
  class PostsController < ApplicationController
    before_action { authorize Post }

    def new
      @form = PostForm.new(Post.new, {})
    end

    def create
      @form = PostForm.new(Post.new, post_params.merge({user_id: current_user.id}))
      if @form.save
        flash[:notice] = 'Post succesfully added'
        redirect_to @form
      else
        flash[:danger] = 'Something went wrong'
        render 'new'
      end
    end

    def edit
      @post = Post.friendly.find(params[:id])
      @form = PostForm.new(@post, {})
    end

    def update
      @post = Post.friendly.find(params[:id])
      @form = PostForm.new(@post, post_params.merge({user_id: current_user.id}))
      if @form.save
        flash[:notice] = 'Post succesfully updated'
        redirect_to @form
      else
        flash[:danger] = 'Something went wrong'
        render 'edit'
      end
    end

    def destroy
      @post = Post.friendly.find(params[:id])
      @post.destroy
      flash[:notice] = 'Post succesfully deleted'
      redirect_to root_path
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, { images: [] })
    end
  end
end
