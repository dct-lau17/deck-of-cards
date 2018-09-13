class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def show_card
    [value, suit].join(' of ')
  end
end
