require 'game'

RSpec.describe 'Feature Test' do
  subject(:game) { Game.new }
  let(:sequenced_deck) { Deck.new.cards}

  describe '#defaults' do
    it 'initiates with a full deck of cards' do
      expect(game.deck.cards.length).to eq 52
    end

    it 'initiates with a full deck of cards in sequence order' do
      expect(game.deck.cards[0].show_card).to eq 'Ace of Hearts'
      expect(game.deck.cards[1].show_card).to eq 'Two of Hearts'
      expect(game.deck.cards[51].show_card).to eq 'King of Diamonds'
    end

    it 'initiates with 4 players' do
      expect(game.players.length).to eq 4
    end
  end

  describe '#shuffle_deck' do
    before(:each) do
      game.shuffle_deck
      @shuffled_deck = show_card_array(game.deck.cards)
      @original_deck = show_card_array(sequenced_deck)
    end

    it 'can shuffle the deck of cards' do
      expect(@shuffled_deck).not_to eq @original_deck
    end
  end

  def show_card_array(array)
    cards = []
    array.each { |card| cards << card.show_card }
    cards
  end
end
