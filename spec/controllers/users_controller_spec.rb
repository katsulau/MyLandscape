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
end
