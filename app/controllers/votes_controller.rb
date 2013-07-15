class VotesController < ApplicationController
  before_filter :validate_user, :except => [:index]

  def validate_user
    if not current_user.present?
      render json: "User not logged in".to_json, status: :unprocessable_entity
      false
    end
    true
  end

  def index
    @turtle = Turtle.find_by_id(params[:turtle_id])
    votes = @turtle.votes.find_by_user_id(current_user.id)
    render json: votes
  end

  def create
    @vote = Vote.new(params[:vote])

    # no matter what we got from the user, the user_id should always be the current one
    @vote.user_id = current_user.id
    
    if @vote.save
      render json: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  def destroy
    votes = Vote.where(id: params[:id], user_id: current_user.id)
    
    if votes.length == 1
      votes[0].destroy
      head :ok
    else
      render json: "not found".to_json, status: :unprocessable_entity
    end
  end

end
