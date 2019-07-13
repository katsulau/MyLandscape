require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:posts) { create_list(:post, 3, user_id: user.id) }

  describe 'GET #show' do
    it "assigns the requested user to @user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq user
    end

    it "assigns the requested posts to @posts" do
      get :show, params: { id: user.id }
      expect(assigns(:posts)).to eq posts
    end

    it "renders the :show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "assigns the requested user to @user" do
      get :edit, params: { id: user.id }
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do
      get :edit, params: { id: user.id }
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    it "locates the requersted @user" do
      patch :update, params: { user: attributes_for(:user), id: user.id }
      expect(assigns(:user)).to eq user
    end

    it "changes @user's attributes" do
      patch :update, params: { id: user.id, user: attributes_for(:user, name: 'abc') }
      user.reload
      expect(user.name).to eq("abc")
    end

    it "redirects to user_path" do
      patch :update, params: { user: attributes_for(:user), id: user.id }
      expect(response).to redirect_to user_path(user)
    end
  end
end
