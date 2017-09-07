feature 'Add post' do
  scenario 'admin creates a new post' do
    log_in
    visit new_admin_post_path

    fill_in 'Title', with: 'testing'
    fill_in 'content', with: 'tralalala'

    click_button 'Add'

    expect(page).to have_content 'Post succesfully added'
  end

  def log_in
    User.create(email: 'test@rspec.com', password: '123123', role: 'admin')
    visit new_user_session_path
    fill_in 'Email', with: 'test@rspec.com'
    fill_in 'Password', with: '123123'
    click_button 'Sign in'
  end
end
