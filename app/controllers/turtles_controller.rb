class TurtlesController < ApplicationController
  def index
    @turtles = Turtle.order("score DESC")
  end

  def show
    @turtle = Turtle.find(params[:id])
  end

  def new
    @turtle = Turtle.new
  end

  def create
    @turtle = Turtle.new(params[:turtle])
    @turtle.user = current_user
    if @turtle.save
      redirect_to turtles_path
    else
      render action: "new"
    end
  end

  def upvote
    vote(1)
  end

  def downvote
    vote(-1)
  end

  def clearvote
    destroy_current_vote
    
    @turtle = Turtle.find(params[:id])
    render json: @turtle, :only => :score
  end
  
  private
  def destroy_current_vote
    v = current_user.votes.find_by_turtle_id(params[:id])
    if v.present?
      v.destroy
    end
  end

  def vote(scoreToAdd)
    @turtle = Turtle.find(params[:id])

    destroy_current_vote
    
    v = Vote.new
    v.user = current_user
    v.turtle = @turtle
    v.upvote = (scoreToAdd > 0)

    v.save

    @turtle.reload
    render json: @turtle, :only => :score
  end

end