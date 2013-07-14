require 'spec_helper'

describe Vote do

  let(:prepared_turtle) { FactoryGirl.create(:turtle) }

  describe :creating_upvote do

    it "should raise the turtle's score by 1" do
      v = Vote.new({user_id: 0, turtle_id: prepared_turtle.id, upvote: true})
      v.save
      prepared_turtle.reload

      prepared_turtle.score.should eq(1)
    end
  end

  describe :creating_downvote do
    it "should decrease the turtle's score by 1" do
      v = Vote.new({user_id: 0, turtle_id: prepared_turtle.id, upvote: false})
      v.save
      prepared_turtle.reload

      prepared_turtle.score.should eq(-1)
    end
  end


  describe :destroying_upvote do
    it "should decrease the turtle's score by 1" do
      v = Vote.new({user_id: 0, turtle_id: prepared_turtle.id, upvote: true})
      v.save
      prepared_turtle.reload
      prepared_turtle.score.should eq(1)
      
      v.destroy
      prepared_turtle.reload
      prepared_turtle.score.should eq(0)
    end
  end

  describe :destroying_downvote do
    it "should increase the turtle's score by 1" do
      v = Vote.new({user_id: 0, turtle_id: prepared_turtle.id, upvote: false})
      v.save
      prepared_turtle.reload
      prepared_turtle.score.should eq(-1)
      
      v.destroy
      prepared_turtle.reload
      prepared_turtle.score.should eq(0)
    end
  end

end