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
    if @turtle.save
      redirect_to turtles_path
    else
      render action: "new"
    end
  end
end