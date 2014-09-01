class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @user = User.find params[:user_id]
    response = HTTParty.get("http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=#{Rails.application.secrets.steam_api_key}&steamid=#{@user.steam_id}&include_appinfo=1&format=json")
    @games = response.parsed_response['response']
  end

  # GET /games/1
  # GET /games/1.json
end
