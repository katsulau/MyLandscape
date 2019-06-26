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
      expect {
        post :create, params: { user_id: user.id, post: attributes_for(:post) }
      }.to change(Post, :count).by(1)
    end

    it "redirects to posts#index" do
      post :create, params: { user_id: user.id, post: attributes_for(:post) }
      expect(response).to redirect_to posts_path
    end
  end

  describe 'GET #show' do
    before do
      login_user user
    end

    it "assigns the requested post to @post" do
      post = create(:post, user_id: user.id)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "renders the :show template" do
      post = create(:post, user_id: user.id)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end
end