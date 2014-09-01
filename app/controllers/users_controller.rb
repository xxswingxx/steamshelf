class UsersController < ApplicationController
  before_filter :load_user, only: :create
  def new
    @user = User.new
  end

  def create
    @user.save if !@user.persisted?
    redirect_to user_games_path(@user)
  end

  def show
  end

  private
  def load_user
    @user = User.find_by_steam_name(params[:user][:steam_name]) || User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:steam_name)
  end
end