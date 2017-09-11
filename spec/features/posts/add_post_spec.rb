feature 'Add post', js: true do
  scenario 'admin creates a new post', driver: :selenium do
    title = 'testtest'
    content = 'somecontent'
    log_in
    visit new_admin_post_path

    fill_in 'Title', with: title
    fill_in_ckeditor 'content', with: content

    click_button 'Add'

    expect(page).to have_content 'Post succesfully added'
    expect(page).to have_content title
    expect(page).to have_content content
  end
end
