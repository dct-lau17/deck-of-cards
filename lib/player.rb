class Player
  attr_reader :hand

  def initialize
    @hand = []
  end

  def get_card(card)
    hand << card
  end

  def show_hand
    output = []
    hand.each { |card| output << card.show_card }
    output
  end
end
