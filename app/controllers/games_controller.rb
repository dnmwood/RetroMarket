require 'net/https'
require 'json'
require 'uri'
# When a game is added to a user's collection, we make an API POST request
# to IGDB.com for that game's data, and save that data to an instance of
# a game.
class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user
  before_action :load_game_key

  def index
    @games = @user.games
  end

  def create
    # fetch_test
    game_title = params['game']['title']
    game_data = get_game_data_with(game_title)
    save_game_details(game_data)
  end

  def get_game_data_with(title)
    game_data = igdb_query_response(title)
    game_data
  end

  def save_game_details(data)
    game = data['game']
    @game = Game.new(user_id: @user.id,
                     igdb_id: game['id'],
                     title: game['name'],
                     genres: game['genres'],
                     platforms: game['platforms'])
    if @game.save
      redirect_to games_url
    else
      render :new
    end
  end

  def new
    @game = Game.new
    @game.save
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def load_user
    @user = current_user if user_signed_in?
  end

  def load_game_key
    @igdb_key = Rails.application.secrets.game_key
  end

  def igdb_query_response(title)
    http = Net::HTTP.new('api-v3.igdb.com', 80)
    request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/search'),
                                 'user-key' => @igdb_key)
    request.body = "fields game.id,game.name,game.genres,game.platforms;
                    where name = \"#{title}\";"
    response = JSON.parse(http.request(request).body).first
    response
  end

  def fetch_test
    http = Net::HTTP.new('api-v3.igdb.com', 80)
    request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/genres'), 'user-key' => @igdb_key)
    request.body = 'fields *; where id = (8,31);'
    response = JSON.parse(http.request(request).body).first
    response
  end
end
