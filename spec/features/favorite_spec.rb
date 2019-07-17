require 'rails_helper'

feature 'favorite', type: :feature do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id, id: 1, name: "東京") }

  background do
    visit root_path
    expect(page).to have_no_content('投稿する')
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[id="normal_login"]').click
  end

  scenario 'can add a post in my favorite list', js: true do
    visit root_path
    click_link('全投稿一覧')
    expect(current_path).to eq "/ja/posts"
    visit "ja/posts/1"
    expect(current_path).to eq "/ja/posts/1"

    expect do
      find('button[class="good-btn"]').click
      sleep 0.5
    end.to change(Favorite, :count).by(1)

    expect do
      find('button[class="good-btn"]').click
      sleep 0.5
    end.to change(Favorite, :count).by(-1)
  end
end
