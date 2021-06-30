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

  end
end
