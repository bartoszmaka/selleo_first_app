feature 'Add comment', js: true do
  scenario 'admin user can add comment' do
    post = create(:post)
    log_in

    visit post_path(post)

    fill_in_ckeditor 'content', with: 'some testing message'

    expect { click_button 'Add' }.to change { Comment.count }.by(1)
    expect(page).to have_content 'Comment succesfully added'
  end

  scenario 'normal user can add comment' do
    post = create(:post)
    log_in(:user)

    visit post_path(post)

    fill_in_ckeditor 'content', with: 'some testing message'

    expect { click_button 'Add' }.to change { Comment.count }.by(1)
    expect(page).to have_content 'Comment succesfully added'
  end

  scenario 'guest user cannot add comment' do
    post = create(:post)

    visit post_path(post)

    expect(page).not_to have_button 'Add'
  end
end
