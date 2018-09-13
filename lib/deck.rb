require_relative 'card.rb'

class Deck
  attr_reader :cards

  VALUE = %w[Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King]
          .freeze

  SUITS = %w[Hearts Clubs Spades Diamonds].freeze

  def initialize(cards = generate_cards)
    @cards = cards
  end

  def shuffle_deck
    cards.shuffle!
  end

  def deal
    cards.pop
  end

  private

  def generate_cards
    deck = []
    SUITS.each do |suit|
      VALUE.each do |value|
        card = Card.new(value, suit)
        deck << card
      end
    end
    deck
  end
end
