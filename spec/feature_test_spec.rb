require 'game'
require 'player'

RSpec.describe 'Feature Test' do
  subject(:game) { Game.new }
  let(:sequenced_deck) { Deck.new.cards }
  let(:card1) { double(:card, show_card: 'Ten of Hearts') }
  let(:card2) { double(:card, show_card: 'Jack of Hearts') }
  let(:card3) { double(:card, show_card: 'Queen of Hearts') }
  let(:card4) { double(:card, show_card: 'King of Hearts') }

  describe '#default' do
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
    it 'can shuffle the deck of cards' do
      game.shuffle_deck
      shuffled_deck = show_card_array(game.deck.cards)
      original_deck = show_card_array(sequenced_deck)
      expect(shuffled_deck).not_to eq original_deck
    end
  end

  describe '#deal' do
    it 'deals 7 cards to all players' do
      game.deal
      expect(game.players[0].hand.length).to eq 7
      expect(game.players[1].hand.length).to eq 7
      expect(game.players[2].hand.length).to eq 7
      expect(game.players[3].hand.length).to eq 7
    end

    it 'removes cards from the deck' do
      expect { game.deal }.to change { game.deck.cards.length }.by(-7 * 4)
    end
  end

  describe '#show_all_hands' do
    expected_print_out = "Player 1 hand\n"\
                         "Ten of Hearts\n"\
                         "----------\n"\
                         "Player 2 hand\n"\
                         "Jack of Hearts\n"\
                         "----------\n"\
                         "Player 3 hand\n"\
                         "Queen of Hearts\n"\
                         "----------\n"\
                         "Player 4 hand\n"\
                         "King of Hearts\n"\
                         "----------\n"
    before(:each) do
      game.players[0].get_card(card1)
      game.players[1].get_card(card2)
      game.players[2].get_card(card3)
      game.players[3].get_card(card4)
    end

    it 'displays all cards from each player' do
      expect { game.show_all_hands }.to output(expected_print_out).to_stdout
    end
  end

  def show_card_array(array)
    cards = []
    array.each { |card| cards << card.show_card }
    cards
  end
end
