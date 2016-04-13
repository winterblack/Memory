require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  def initialize(board, player)
    @board = board
    @player = player
  end

  def play
    until @board.won?
      play_turn
    end
  end

  def play_turn
    @board.render
    first_guess = @player.guess
    second_guess = @player.guess
    unless @board[first_guess] == @board[second_guess]
      sleep(1)
      @board[first_guess].hide
      @board[second_guess].hide
    end
  end
end

if __FILE__ == $PROGRAM_NAME

board = Board.new
player = ComputerPlayer.new(board)
game = Game.new(board, player)
game.play

end
