class Card
  attr_reader :value

  def initialize(value)
    @value = value
    @revealed = false
  end

  def to_s
    revealed? ? "[#{value}]" : "[ ]"
  end

  def reveal
    @revealed = true
  end

  def hide
    @revealed = false
  end

  def revealed?
    @revealed
  end

  def ==(card)
    card.value == value
  end
end
