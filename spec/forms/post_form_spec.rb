require 'pry'

describe PostForm do
  context 'is valid' do
    it 'creates new post' do
      @user = FactoryGirl.create(:user)
      @form = PostForm.new(Post.new, FactoryGirl.attributes_for(:post, user_id: @user.id))

      expect(@form.valid?).to be true
      expect { @form.save }.to change { Post.count }.by(1)
    end
  end

  context 'is invalid' do
    it 'requires content' do
      @user = FactoryGirl.create(:user)
      @form_without_content = PostForm.new(Post.new, FactoryGirl.attributes_for(:post, user_id: @user.id, content: ''))

      expect(@form_without_content.save).to be false
      expect(@form_without_content.errors.messages.keys).to contain_exactly(:content)
    end

    it 'requires user' do
      @form_without_user = PostForm.new(Post.new, FactoryGirl.attributes_for(:post))

      expect(@form_without_user.save).to be false
      expect(@form_without_user.errors.messages.keys).to contain_exactly(:user_id)
    end

    it 'requires title' do
      @user = FactoryGirl.create(:user)
      @form_without_title = PostForm.new(Post.new, FactoryGirl.attributes_for(:post, user_id: @user.id, title: ''))

      expect(@form_without_title.save).to be false
      expect(@form_without_title.errors.messages.keys).to contain_exactly(:title)
    end
  end
end
