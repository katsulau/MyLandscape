require 'rails_helper'

describe Post do
  describe "#create" do
    before do
      @user = create(:user)
    end

    it "is valid with name, image, and description" do
      post = build(:post, user_id: @user.id)
      expect(post).to be_valid
    end
  end
end