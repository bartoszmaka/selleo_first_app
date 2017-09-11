feature 'Edit post', js: true do
  scenario 'admin edits post' do
    title = 'testtest'
    content = 'somecontent'
    post = create(:post, title: title, content: content)
    log_in
    visit post_path(post)

    expect(page).to have_content title
    expect(page).to have_content content

    click_link 'Edit'
    new_title = 'new title'
    new_content = 'new content'
    fill_in 'Title', with: new_title
    # fill_in 'content', with: new_content
    fill_in_ckeditor 'content', with: new_content

    click_button 'Add'

    expect(page).to have_content 'Post succesfully updated'
    expect(page).to have_content new_title
    expect(page).to have_content new_content
  end
end

