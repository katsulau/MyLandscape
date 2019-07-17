require 'rails_helper'

feature 'post', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id, id: 1) }

  background do
    visit root_path
    expect(page).to have_no_content('投稿する')
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[id="normal_login"]').click
  end

  scenario "POST post" do
    expect do
      visit root_path
      click_link('投稿する')
      expect(current_path).to eq "/ja/posts/new"
      fill_in 'post_name', with: 'テスト'
      attach_file 'file', 'app/assets/images/first-slide.jpg', visible: false
      fill_in 'post_description', with: 'テストです'
      find('input[type="submit"]').click
    end.to change(Post, :count).by(1)
  end
end
