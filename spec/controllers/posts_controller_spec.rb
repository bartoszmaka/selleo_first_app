require 'pry'

describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'has 200 OK http status' do
      get :index

      expect(response).to have_http_status 200
    end
  end

  describe 'GET #show' do
    it 'has 200 OK http status' do
      resource = create(:post)

      get :show, params: { id: resource.id }

      expect(response).to have_http_status 200
    end
  end
end
