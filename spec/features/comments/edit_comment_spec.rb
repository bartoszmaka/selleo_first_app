feature 'Edit comment', js: true do
  scenario 'admin can edit any comment' do
    post = create(:post)
    comment = create(:comment, post: post)
    log_in

    visit post_path(post)

    within('div', id: "#{comment.id}") do
      click_link 'edit'
    end

    fill_in_ckeditor 'content', with: 'edit testing message'
    click_button 'Add'

    expect(page).to have_content 'edit testing message'
    expect(page).to have_content 'Comment succesfully updated'
  end

  scenario 'user can edit his own comment' do
    post = create(:post)
    user = log_in('user')
    comment = create(:comment, post: post, owner: user)

    visit post_path(post)

    within('div', id: "#{comment.id}") do
      click_link 'edit'
    end

    fill_in_ckeditor 'content', with: 'edit testing message'
    click_button 'Add'

    expect(page).to have_content 'Comment succesfully updated'
    expect(page).to have_content 'edit testing message'
  end

  scenario 'user cannot edit other user comment' do
    post = create(:post)
    log_in('user')
    comment = create(:comment, post: post)

    visit post_path(post)

    within('div', id: "#{comment.id}") do
      expect(page).not_to have_button('edit')
    end
  end
end

