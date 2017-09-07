describe Admin::PostsController, type: :controller do
  describe 'GET #new' do
    context 'user is authenticated' do
      it 'has 200 OK http status' do
        sign_in create(:admin)
        get :new

        expect(response).to have_http_status 200
      end
    end

    context 'user is not authenticated' do
      it 'redirects to root_path' do
        get :new
        expect(response).to have_http_status 302
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #edit' do
    context 'user is authenticated' do
      it 'has 200 OK http status' do
        resource = create(:post)
        sign_in create(:admin)

        get :edit, params: { id: resource.id }

        expect(response).to have_http_status 200
      end
    end

    context 'user is not authenticated' do
      it 'redirects to root_path' do
        resource = create(:post)
        get :edit, params: { id: resource.id }
        expect(response).to have_http_status 302
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user is authenticated' do
      it 'has 200 OK http status' do
        sign_in create(:admin)
        resource = create(:post)
        posts_count_before = Post.count
        delete :destroy, params: { id: resource.id }

        expect(response).to have_http_status 302
        expect(response).to redirect_to root_path
        expect(Post.count).to eq(posts_count_before - 1)
      end
    end

    context 'user is not authenticated' do
      it 'redirects to root_path' do
        resource = create(:post)
        posts_count_before = Post.count
        delete :destroy, params: { id: resource.id }

        expect(response).to have_http_status 302
        expect(response).to redirect_to root_path
        expect(Post.count).to eq(posts_count_before)
      end
    end
  end

  describe 'POST #create' do
    context 'user is authenticated' do
      it 'succesfully creates post' do
        admin = create(:admin)
        post_params = attributes_for(:post, user_id: admin.id)

        sign_in admin
        post :create, params: { post: post_params }

        expect(response).to have_http_status 302
        expect(response).to redirect_to Post.last
      end

      it 'calls PostForm' do
        post_form = double(PostForm)
        allow(PostForm).to receive(:new).and_return(post_form)
        allow(post_form).to receive(:save) { false }
        admin = create(:admin)
        post_params = attributes_for(:post, user_id: admin.id)

        sign_in admin
        post :create, params: { post: post_params }

        expect(PostForm).to have_received(:new)
        expect(post_form).to have_received(:save)
      end
    end

    context 'user is not authenticated' do
      it 'redirects to root_path' do
        post_form = double(PostForm)
        allow(PostForm).to receive(:new).and_return(post_form)
        allow(post_form).to receive(:save)
        user = create(:user)
        params = attributes_for(:post, user_id: user.id)
        post :create, params: params

        expect(response).to have_http_status 302
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PUT #update' do
    context 'user is authenticated' do
      it 'succesfully creates post' do
        admin = create(:admin)
        resource = create(:post, owner: admin)
        post_params = attributes_for(:post, user_id: admin.id)

        sign_in admin
        post :create, params: { id: resource.id, post: post_params }

        expect(response).to have_http_status 302
        expect(response).to redirect_to Post.last
      end

      it 'calls PostForm' do
        post_form = double(PostForm)
        allow(PostForm).to receive(:new).and_return(post_form)
        allow(post_form).to receive(:save) { false }
        admin = create(:admin)
        resource = create(:post, owner: admin)
        post_params = attributes_for(:post, user_id: admin.id)

        sign_in admin
        post :create, params: { id: resource.id, post: post_params }

        expect(PostForm).to have_received(:new)
        expect(post_form).to have_received(:save)
      end
    end

    context 'user is not authenticated' do
      it 'redirects to root_path' do
        resource = create(:post)
        post_params = attributes_for(:post, user_id: resource.owner.id)
        put :update, params: { id: resource.owner.id }.merge(post_params)

        expect(response).to have_http_status 302
        expect(response).to redirect_to root_path
      end
    end
  end
end
