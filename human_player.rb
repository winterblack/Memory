require_relative 'board'

class HumanPlayer
  def initialize(board)
    @board = board
  end

  def guess
    puts "Select a row and a column: \"row, column\""
    pos = guess_pos
    @board[pos].reveal
    @board.render
    pos
  end

  private
  def guess_pos
    gets.chomp.split(", ").map { |char| char.to_i }
  end
end
