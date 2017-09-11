feature 'Edit comment', js: true do
  scenario 'admin can edit any comment' do
    post = create(:post)
    comment = create(:comment, post: post)
    log_in

    visit post_path(post)

    within('div', id: "#{comment.id}") do
      click_link 'edit'
    end

    binding.pry
    fill_in_ckeditor 'comment-content', with: 'edit testing message'
    # fill_in 'content', with: 'edit testing message'
    # page.driver.browser.navigate.refresh
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
      expect { click_link 'edit' }.to change { Comment.count }.by(-1)
    end

    fill_in_ckeditor 'comment-content', with: 'edit testing message'

    expect(page).to have_content 'Comment succesfully editd'
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

