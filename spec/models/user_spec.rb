require 'spec_helper'

describe User do

  describe "Interface" do

    before do
      @user = User.new(email: 'dibbleboggins@example.com')
    end

    subject { @user }

    it { should respond_to(:email) }

  end

  describe "Validations" do

    it "should require an email" do
      User.new.should have(1).error_on :email
    end

    it "should have a valid email" do
      user = User.new(email: 'dave examplecom')
      user.should have(1).error_on :email
    end

    it "should have a unique email" do
      FactoryGirl.create(:user, email: 'hi@example.com')
      User.new(email: 'hi@example.com').should have(1).error_on :email
    end
  end
end
