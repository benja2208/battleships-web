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
    board.place(Ship.new(size: 1), params[:ship_1_position].upcase.to_sym, params[:ship_1_orientation].to_sym)
    $game.player_1.board = board

    $game.player_2 = Player.new("Computer")
    $game.player_2.board = Board.new({cell: Cell, size: 9, number_of_pieces: 1})
    $game.player_2.board.fill_all_content(Water.new)
    $game.player_2.board.place(Ship.new(size: 1), params[:ship_1_position].upcase.to_sym, params[:ship_1_orientation].to_sym)

    erb :welcome
  end

  post '/shoot' do
    $game.make_move(params[:position].to_sym)
    if $game.over?
      "Game is over"
    else
      "Bad luck"
    end
  end


  set :views, Proc.new { File.join(root, "..", "views") }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
