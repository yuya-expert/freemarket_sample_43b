require 'rails_helper'

describe User do
  describe "#create" do
    it "is valid with email, password" do
      expect(build(:user)).to be_valid
    end
    it "is invalid without email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "is invalid without password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "is invalid password != password_confirmation" do
      user = build(:user, password: "pass")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "is invalid not unique email" do
      user1 = create(:user)
      user2 = build(:user)
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end
  end
end
