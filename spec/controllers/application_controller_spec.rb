require 'spec_helper'

describe ApplicationController do

  let(:precreated_user) { FactoryGirl.create(:user) }

  describe :current_user do
    context "user has logged in" do
      before do
        controller.sign_in precreated_user
      end

      it "should return the current user" do
        controller.current_user.should_not be_nil
        controller.current_user.id.should eq(precreated_user.id)
      end
    end
    
    context "user has not logged in" do
      it "should return nil" do
        controller.current_user.should be_nil
      end
    end
  end

  describe :authenticated? do
    context "user has logged in" do
      before do
        controller.sign_in precreated_user
      end

      it "should return true" do
        controller.authenticated?.should be_true
      end
    end
    
    context "user has not logged in" do
      it "should return false" do
        controller.authenticated?.should be_false
      end
    end
  end

  describe :sign_in do
    it "should sign in the correct user" do
      controller.sign_in precreated_user
      
      controller.authenticated?.should be_true
      controller.current_user.should_not be_nil
      controller.current_user.id.should eq(precreated_user.id)
    end

  end



end