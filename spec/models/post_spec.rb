require 'rails_helper'

describe Post do
  before do
    I18n.locale = :en
  end

  describe "#create" do
    before do
      @user = create(:user)
    end

    it "is valid with name, image, and description" do
      post = build(:post, user_id: @user.id)
      expect(post).to be_valid
    end

    it "is valid without a description" do
      post = build(:post, user_id: @user.id, description: nil)
      expect(post).to be_valid
    end

    it "is invalid without a name" do
      post = build(:post, user_id: @user.id, name: nil)
      post.valid?
      expect(post.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an image" do
      post = build(:post, user_id: @user.id, image: nil)
      post.valid?
      expect(post.errors[:image]).to include("can't be blank")
    end
  end
end
