require 'spec_helper'

describe TeasersController do

  describe "GET 'index'" do

    it { should respond_to :index }
  end

  describe "POST 'create'" do

    it { should respond_to :create }

    it "should return success" do
      post :create, email: 'doofder@example.com'
      response.should be_success
    end

    it "should create a user" do
      lambda do
        post :create, email: 'doofder@example.com'
      end.should change(User, :count).by 1
    end

    it "should return fail if email is not formatted properly" do
      lambda do
        post :create, email: 'doofder@example'
      end.should_not change(User, :count).by 1

      response.should be_bad_request
    end
  end

end
