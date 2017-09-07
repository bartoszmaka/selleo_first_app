require 'pry'

describe PostForm do
  context 'is valid' do
    it 'creates new post' do
      user = create(:user)
      params = { title: 'test', content: 'test', user_id: user.id }
      form = PostForm.new(Post.new, params)

      expect(form.valid?).to be true
      expect { form.save }.to change { Post.count }.by(1)
    end
  end

  context 'is invalid' do
    it 'requires content' do
      user = create(:user)
      params = { title: 'test', content: '', user_id: user.id }
      form_without_content = PostForm.new(Post.new, attributes_for(:post, user_id: user.id, content: ''))

      expect(form_without_content.save).to be false
      expect(form_without_content.errors.messages.keys).to contain_exactly(:content)
    end

    it 'requires user' do
      params = { title: 'test', content: 'test' }
      form_without_user = PostForm.new(Post.new, params)

      expect(form_without_user.save).to be false
      expect(form_without_user.errors.messages.keys).to contain_exactly(:user_id)
    end

    it 'requires title' do
      user = create(:user)
      params = { title: '', content: 'test', user_id: user.id }
      form_without_title = PostForm.new(Post.new, params)

      expect(form_without_title.save).to be false
      expect(form_without_title.errors.messages.keys).to contain_exactly(:title)
    end
  end
end
