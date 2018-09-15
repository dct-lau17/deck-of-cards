require 'deck'

RSpec.describe Deck do
  describe '#default' do
    subject(:full_deck) { described_class.new }
    it 'generates a deck of cards when initialised' do
      expect(full_deck.cards.length).to eq 52
    end
  end

  before(:each) do
    card1 = double(:card, value: 'Ten', suit: 'Hearts', show_card: 'Ten of Heart')
    card2 = double(:card, value: 'Jack', suit: 'Hearts', show_card: 'Jack of Heart')
    card3 = double(:card, value: 'Queen', suit: 'Hearts', show_card: 'Queen of Heart')
    card4 = double(:card, value: 'King', suit: 'Hearts', show_card: 'King of Heart')
    card5 = double(:card, value: 'Ace', suit: 'Clubs', show_card: 'Ace of Clubs')
    mock_cards = [card1, card2, card3, card4, card5]
    @deck = described_class.new(mock_cards)
    @original_deck = [card1, card2, card3, card4, card5]
    @deck.shuffle_deck
  end

  describe '#shuffle' do
    it 'shuffles the deck of cards' do
      expect(@deck.cards).not_to equal @original_deck
    end
  end

  describe '#deal' do
    it 'removes a card from the deck' do
      @deck.deal
      expect(@deck.cards.length).to eq 4
    end
  end
end
