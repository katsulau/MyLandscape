require 'rails_helper'

describe PostsController, type: :controller  do
  let(:user) { create(:user) }
  let(:posts) { create_list(:post, 3, user_id: user.id) }

  describe 'GET #index' do
    # it "assigns the requested posts to @posts" do
    #     get :index
    #     expect(assigns(:posts)).to eq posts
    # end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

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

  describe 'GET #edit' do
    let(:post) { create(:post, user_id: user.id)}

    it "assigns the requested post to @post" do
      get :edit, params: { id: post.id }
      expect(assigns(:post)).to eq post
    end

    it "renders the :edit template" do
      get :edit, params: { id: post.id }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let(:post) { create(:post, user_id: user.id)}

    before do
      login_user user
    end

    it "locates the requersted @post" do
      patch :update, params: { post: attributes_for(:post), id: post.id }
      expect(assigns(:post)).to eq post
    end

    it "changes @post's attributes" do
      patch :update, params: {id: post.id, post: attributes_for(:post, name: 'abcde')}
      post.reload
      expect(post.name).to eq("abcde")
    end

    it "redirects to post_path" do
      patch :update, params: { post: attributes_for(:post), id: post.id }
      expect(response).to redirect_to post_path(post)
    end
  end
end