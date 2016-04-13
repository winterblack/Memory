require_relative 'board'

class ComputerPlayer

  def initialize(board)
    @board = board
    @history = Hash.new { |history, card| history[card] = Array.new }
    @previous_guess = nil
    create_positions(board.size)
  end

  def guess
    match ? pos = @history[match].shift : pos = random_guess
    guess_pos(pos)
  end

  private
  def match
    @history.each { |card, pos| return card if pos.count > 1}
    false
  end

  def random_guess
    @positions.shuffle!.pop
  end

  def guess_pos(pos)
    card = @board[pos].value
    update_positions(pos)
    update_history(card, pos)
    reset_previous_guess(card)
    render_board(pos)
    pos
  end

  def update_positions(pos)
    @positions.delete(pos)
  end

  def update_history(card, pos)
    @history[card] << pos
    @history.delete(card) if card == @previous_guess
  end

  def reset_previous_guess(card)
    @previous_guess ? @previous_guess = nil : @previous_guess = card
  end

  def render_board(pos)
    @board[pos].reveal
    @board.render
    sleep(1)
  end

  def create_positions(size)
    @positions = []
    size.times do |row|
      (size + 1).times do |col|
        @positions << [row, col]
      end
    end
  end
end
