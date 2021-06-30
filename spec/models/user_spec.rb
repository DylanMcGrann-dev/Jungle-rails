require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.new(
        firstname: "dylan",
        lastname: "mcgrann",
        email: "x@y.com",
        password: "king123",
        password_confirmation: "king123"
      )
    end

    it "should save successfully when all feilds are filled out properly" do
      expect(@user.save!).to be true
    end

    it "should fail when password is not entered" do
      @user.password = nil 
      expect(@user.save).to be false
      expect(@user.errors.full_messages[0]).to eq("Password can't be blank")
    end

    it "should fail when password confirmation is not entered" do
      @user.password_confirmation = nil 
      expect(@user.save).to be false
      expect(@user.errors.full_messages[0]).to eq("Password confirmation can't be blank")
    end

    it "should fail when password and confirmation don't match" do
      @user.password = "notright"
      expect(@user.save).to be false
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it "should not allow an email that already exists, not case sensitive" do
      @user.save
      @user2 = User.new(
        firstname: "joe",
        lastname: "dirt",
        email: "X@y.com",
        password: "king123",
        password_confirmation: "king123"
      )
      expect(@user2.save).to be false
      expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
    end

    it "should return false when no name is given" do
      @user.firstname = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages[0]).to eq("Firstname can't be blank")
    end

    it "should return false when no lastname is given" do
      @user.lastname = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages[0]).to eq("Lastname can't be blank")
    end

    it "shouuld return fasle when no email is given" do 
      @user.email = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
    end

    it "should return false when password is not longer than three characters" do
      @user.password = "hi"
      @user.password_confirmation = "hi"
      expect(@user.save).to be false
      expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 3 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before :each do
      User.create(
        firstname: "dylan",
        lastname: "mcgrann",
        email: "x@y.com",
        password: "king123",
        password_confirmation: "king123"
      )
    end
    it "should return true when email and password match" do
      user = User.authenticate_with_credentials("x@y.com", "king123")
      p user
      expect(user).to be_a User
    end

    it "should return true even when email has capitals" do
      user = User.authenticate_with_credentials("X@Y.com", "king123")
      expect(user).to be_a User
    end

    it "should return true when theres is trailing and or leading white spaces" do
      user = User.authenticate_with_credentials(" x@y.com ", "king123")
      expect(user).to be_a User
    end

  end
end
