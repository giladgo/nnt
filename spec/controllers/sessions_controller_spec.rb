require 'spec_helper'

RSpec.configure do |c|
  c.alias_it_should_behave_like_to :it_has_behavior, 'has behavior:'
end

describe SessionsController do
    let(:precreated_user) { FactoryGirl.create(:user) }

    describe :create do

      context "good login" do

        let (:good_user_params) { { name: precreated_user.name, password: "1234", password_confirmation: "1234" } }


        it "should create a session" do
          post :create, good_user_params
          controller.authenticated?.should be_true
        end

        it "should redirect to root page" do
          post :create, good_user_params
          controller.should redirect_to(root_url)
        end

      end

      context "bad login" do

        let (:bad_user_params) { { name: precreated_user.name, password: "2352345", password_confirmation: "3245345" } }

        it "should not create a session" do
          post :create, bad_user_params
          controller.authenticated?.should be_false
        end

        it "should redirect to the login page" do
          post :create, bad_user_params
          controller.should redirect_to(login_url)
        end
      end

    end

    describe :destroy do

      shared_examples_for "logging out works" do
        it "should clear the session" do
          post :destroy
          controller.authenticated?.should be_false
        end

        it "should redirect to root page" do
          post :destroy
          controller.should redirect_to(root_url)
        end
      end

      context "user already logged in" do
        before do
          controller.sign_in precreated_user
        end
        it_has_behavior "logging out works"
      end

      context "user not logged in" do 
        it_has_behavior "logging out works"
      end

    end
end