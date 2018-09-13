class Player
  attr_reader :hand

  def initialize
    @hand = []
  end

  def get_card(card)
    hand << card
  end
end
