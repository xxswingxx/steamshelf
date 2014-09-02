class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @user = User.find params[:user_id]
    response = HTTParty.get("http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=#{Rails.application.secrets.steam_api_key}&steamid=#{@user.steam_id}&include_appinfo=1&format=json")
    @pile_of_shame = 0
    @games = response.parsed_response['response']

    if @games['games'].present?
      @pile_of_shame = @games['games'].map { |game| game['playtime_forever'] if game['playtime_forever'].zero? }.compact.count 
      @games['games'] = @games['games'].sort_by { |k| k['name'] }.each
    end
  end

  # GET /games/1
  # GET /games/1.json
end
