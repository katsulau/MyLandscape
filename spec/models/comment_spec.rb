require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:another_user) {create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  describe "#create" do
    it "is valid with text" do
      comment = build(:comment, user_id: user.id, post_id: post.id)
      expect(comment).to be_valid
    end

    it "is valid if an another_user comments" do
      comment = build(:comment, user_id: another_user.id, post_id: post.id)
      expect(comment).to be_valid
    end

    it "is invalid without text" do
      comment = build(:comment, text: "", user_id: user.id, post_id: post.id)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it "is invalid without user_id" do
      comment = build(:comment, post_id: post.id)
      comment.valid?
      expect(comment.errors[:user]).to include("must exist")
    end
  end
end
