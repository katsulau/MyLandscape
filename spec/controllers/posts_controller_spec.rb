require 'rails_helper'

describe PostsController, type: :controller  do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end

    it "saves the new post in the database" do
      expect do
        post :create, params: { post: attributes_for(:post) }
      end.to change(Post, :count).by(1)
    end

    it "redirects to posts#index" do
      post :create, params: { post: attributes_for(:post) }
      expect(response).to redirect_to posts_path
    end
  end
end