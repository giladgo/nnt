class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to turtles_path
    else
      render action: "new"
    end
  end

  def current
    respond_to do |format|
      format.json { render json: current_user.to_json(only: [:id, :name])}
    end
  end
end