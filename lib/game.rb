class Game

  attr_reader :turn
  attr_accessor :player_1, :player_2

  def initialize player_1 = nil , player_2 = nil 
    @player_1, @player_2, @turn = player_1, player_2, player_1
  end

  def make_move position
    opponent.register_shot position
    return "game over" if over?
    switch_turns
  end

  def opponent
    turn == player_1 ? player_2 : player_1
  end

  def over?
    opponent.lost?
  end

  def ready?
    player_1.ready? && player_2.ready?
  end

  private

  def switch_turns
    @turn = opponent
  end

end