require 'rails_helper'

describe User do
  describe "#create" do
    it "is valid with name, image, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end