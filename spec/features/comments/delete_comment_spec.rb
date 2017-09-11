feature 'Delete comment', js: true do
  scenario 'admin can delete any comment' do
    post = create(:post)
    comment = create(:comment, post: post)
    log_in

    visit post_path(post)

    within('div', id: "#{comment.id}") do
      expect { click_link 'delete' }.to change { Comment.count }.by(-1)
    end

    expect(page).to have_content 'Comment succesfully deleted'
  end

  scenario 'user can delete his own comment' do
    post = create(:post)
    user = log_in('user')
    comment = create(:comment, post: post, owner: user)

    visit post_path(post)

    within('div', id: "#{comment.id}") do
      expect { click_link 'delete' }.to change { Comment.count }.by(-1)
    end

    expect(page).to have_content 'Comment succesfully deleted'
  end

  scenario 'user cannot delete other user comment' do
    post = create(:post)
    log_in('user')
    comment = create(:comment, post: post)

    visit post_path(post)

    within('div', id: "#{comment.id}") do
      expect(page).not_to have_button('delete')
    end
  end
end
