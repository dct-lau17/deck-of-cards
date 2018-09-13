require 'deck'

RSpec.describe Deck do
  describe '#defaults' do
    subject(:full_deck) { described_class.new }
    it 'generates a deck of cards when initialised' do
      expect(full_deck.cards.length).to eq 52
    end
  end

  let(:card1) { double(:card, show_card: 'Ten of Heart') }
  let(:card2) { double(:card, show_card: 'Jack of Heart') }
  let(:card3) { double(:card, show_card: 'Queen of Heart') }
  let(:card4) { double(:card, show_card: 'King of Heart') }
  let(:card5) { double(:card, show_card: 'Ace of Clubs') }

  let(:mock_cards) { [card1, card2, card3, card4, card5] }
  subject(:deck) { described_class.new(mock_cards) }

  describe '#shuffle' do
    before(:each) do
      @original_deck = [card1, card2, card3, card4, card5]
      deck.shuffle_deck
    end

    it 'shuffles the deck of cards' do
      expect(deck.cards).not_to equal @original_deck
    end
  end

  describe '#deal' do
    it 'removes a card from the deck' do
      deck.deal
      expect(deck.cards.length).to eq 4
    end
  end
end
