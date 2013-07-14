class TurtlesController < ApplicationController
  def index

    if authenticated?
      @turtles = Turtle.includes(:votes).includes(:user).order("score DESC").limit(20)
      # remove non-current user's votes
      @turtles.each { |t| t.votes.reject! { |vote| vote.user_id != current_user.id } }
    else
      @turtles = Turtle.order("score DESC").limit(20)
    end

    respond_to do |format|
      format.html
      format.json do 
        options = {
          only:  [:id, :name, :description, :score, :created_at],
          methods: [:avatar_thumb_url],
          include: { :user => { only: :name } }
        }
        if authenticated?
          options[:include][:votes] = { only: [:upvote, :user_id, :turtle_id, :id] }
        end
        render json: @turtles.to_json(options) 
      end
    end
  end

  def show
    @turtle = Turtle.find(params[:id])
  end

  def new
    if not authenticated?
      head :unauthorized
      return
    end
    
    @turtle = Turtle.new
  end

  def create
    if not authenticated?
      head :unauthorized
      return
    end

    @turtle = Turtle.new(params[:turtle])
    @turtle.user = current_user
    if @turtle.save
      redirect_to turtles_path
    else
      render action: "new"
    end
  end

end