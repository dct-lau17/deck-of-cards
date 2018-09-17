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
    loop do
      cards.shuffle!
      break if shuffled?
    end
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

  def shuffled?
    cards.each_index do |index|
      if index < cards.length - 1
        if king?(index)
          return false if consecutive_card_after_king?(index)
        elsif consecutive_cards?(index)
          return false
        end
      end
    end
    true
  end

  def king?(index)
    VALUE.index(cards[index].value) == 12
  end

  def consecutive_card_after_king?(index)
    ace?(index) && consecutive_suit?(index)
  end

  def ace?(index)
    next_card_value = VALUE.index(cards[index + 1].value)
    next_card_value.zero?
  end

  def consecutive_suit?(index)
    card_suit = SUITS.index(cards[index].suit)
    next_card_suit = SUITS.index(cards[index + 1].suit)
    card_suit + 1 == next_card_suit
  end

  def consecutive_cards?(index)
    consective_value?(index) && same_suit?(index)
  end

  def consective_value?(index)
    card_value = VALUE.index(cards[index].value)
    next_card_value = VALUE.index(cards[index + 1].value)
    card_value + 1 == next_card_value
  end

  def same_suit?(index)
    card_suit = SUITS.index(cards[index].suit)
    next_card_suit = SUITS.index(cards[index + 1].suit)
    card_suit == next_card_suit
  end
end
