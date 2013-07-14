require 'spec_helper'


describe TurtlesController do

  let(:example_turtle) do
    { name: 'moshe', description: 'blablablabla' } 
  end

  let(:prepared_turtle) { FactoryGirl.create(:turtle) }

  let(:example_user) { FactoryGirl.create(:user) }
  
  context "With authenticated user" do
    before do
      controller.stub :current_user do 
        example_user
      end
    end

    describe :create do
      it "should create a new turtle" do
        expect {
          post :create, turtle: example_turtle
        }.to change{ Turtle.count }.from(0).to(1)
      end
    end

  end

  context "Without authenticated user" do

    describe :create do
      it "should not create a new turtle" do
        post :create, turtle: example_turtle
        expect(Turtle.count).to be(0)
      end
    end

  end

end