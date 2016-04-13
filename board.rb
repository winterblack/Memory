require_relative 'card'

class Board
  attr_reader :size

  def initialize(size = 4)
    @size = size
    @grid = Array.new(@size) { Array.new(@size + 1)}
    populate
  end

  def render
    system("clear")
    @grid.each { |row| puts "#{row.join(" ")}" }
  end

  def reveal(pos)
    self[pos].reveal
  end

  def won?
    each_card { |card| return false unless card.revealed? }
    true
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, card)
    row, col = pos
    @grid[row][col] = card
  end

  private
  def each_card(&prc)
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        prc.call(@grid[row][col])
      end
    end
  end

  def populate
    values = shuffled_values
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        @grid[row][col] = Card.new(values.pop)
      end
    end
  end

  def count
    @size * (@size + 1)
  end

  def shuffled_values
    values = (1..count/2).to_a
    values += values
    values.shuffle
  end
end
