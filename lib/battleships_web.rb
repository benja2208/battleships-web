require 'sinatra/base'
require './lib/game'
require './lib/player'
require './lib/board'
require './lib/water'
require './lib/cell'
require './lib/ship'

class BattleshipsWeb < Sinatra::Base
  $game = Game.new 
  
  get '/' do
    erb :index
  end

  post '/user' do 
    $game.player_1 = Player.new(params[:name])
    board = Board.new({cell: Cell, size: 9, number_of_pieces: 1})
    board.fill_all_content(Water.new)
    board.place(Ship.new(size:1), params[:ship_1_position].upcase.to_sym, params[:ship_1_orientation].to_sym)
    @player_1 = $game.player_1.name
    erb :welcome
  end 


  set :views, Proc.new { File.join(root, "..", "views") }
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
