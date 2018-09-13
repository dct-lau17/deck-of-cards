require_relative 'card.rb'

class Deck
  attr_reader :cards

  VALUE = %w[Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King]
          .freeze

  SUITS = %w[Hearts Clubs Spades Diamonds].freeze

  def initialize
    @cards = []
    generate_cards
  end

  private

  def generate_cards
    SUITS.each do |suit|
      VALUE.each do |value|
        card = Card.new(value, suit)
        cards << card
      end
    end
  end
end
