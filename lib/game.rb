class Game
  attr_reader :deck

  def initialize(deck = Deck.new)
    @deck = deck
  end
end
