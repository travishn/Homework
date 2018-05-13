require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:test_user) do
    User.new(email: 'travis@travis.com', password: 'password')
    # FactoryBot.build(:user, email: 'travis@travis.com', password: 'password')
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }


  describe "#is_password?" do
    it "verifies a correct password" do
      expect(test_user.is_password?("password")).to be true
    end

    it "verifies a password is not correct" do
      expect(test_user.is_password?("wrong_password")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token for a valid user" do
      test_user.valid?
      old_session_token = test_user.session_token
      test_user.reset_session_token!

      expect(test_user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(test_user.reset_session_token!).to eq(test_user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { test_user.save! }

    it "returns the correct user by credentials" do
      expect(User.find_by_credentials("travis@travis.com", "password")).to eq(test_user)
    end

    it "returns nil if given non-existing credentials" do
      expect(User.find_by_credentials("travis@travis.com", "wrong_password")).to eq(nil)
    end
  end
end
