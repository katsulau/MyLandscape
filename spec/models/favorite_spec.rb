require 'rails_helper'

RSpec.describe Favorite, type: :model do

  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  describe "#create" do
    it "is valid with user_id and post_id" do
      favorite = Favorite.create(user_id: user.id, post_id: post.id)
      expect(favorite).to be_valid
    end

    it "is invalid without user_id " do
      favorite = Favorite.create(user_id: nil, post_id: post.id)
      favorite.valid?
      expect(favorite.errors[:user]).to include("must exist")
    end

    it "is invalid without post_id " do
      favorite = Favorite.create(user_id: user.id, post_id: nil)
      favorite.valid?
      expect(favorite.errors[:post]).to include("must exist")
    end
  end
end
