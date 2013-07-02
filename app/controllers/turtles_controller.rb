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
end