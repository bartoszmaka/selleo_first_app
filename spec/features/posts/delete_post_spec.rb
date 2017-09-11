feature 'Delete post', js: true do
  scenario 'admin enters post#show and deletes post' do
    log_in
    title = 'testtest'
    content = 'somecontent'
    post = create(:post, title: 'testtest', content: 'somecontent')
    visit post_path(post)

    expect { click_link 'Delete' }.to change { Post.count }.by(-1)
    expect(page).to have_content 'Post succesfully deleted'

    expect(page).not_to have_content title
    expect(page).not_to have_content content
  end

  scenario 'admin enters post#index and deletes post' do
    log_in
    title = 'very unique title tralalalala'
    content = 'testing something with very unique text'
    3.times { create(:post) }
    post = create(:post, title: title, content: content)

    visit posts_path

    within('div', id: "#{post.id}") do
      click_link 'Delete'
    end

    expect(page).to have_content 'Post succesfully deleted'
    expect(page).not_to have_content title
    expect(page).not_to have_content content
  end
end


