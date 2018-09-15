require 'game'

RSpec.describe Game do
  let(:card_instance) { double(:card) }
  let(:mock_deck) { double(:deck, deal: card_instance) }
  subject(:game) { described_class.new(mock_deck) }

  describe '#default' do
    it 'has a deck of cards' do
      expect(game.deck).to eq mock_deck
    end

    it 'initiates with 4 players' do
      expect(game.players.length).to eq 4
    end
  end

  describe '#shuffle_deck' do
    it 'calls the shuffle method from the deck instance' do
      expect(mock_deck).to receive(:shuffle_deck)
      game.shuffle_deck
    end
  end

  describe '#deal' do
    it 'can deals 2 cards to players' do
      player1 = double(:player)
      players_array = [player1]
      game = Game.new(mock_deck, players_array)
      expect(game.players[0]).to receive(:get_card).exactly(2).times
      game.deal(2)
    end

    it 'deals 7 cards to players by default' do
      game = Game.new(mock_deck)
      expect(game.players[0]).to receive(:get_card).exactly(7).times
      game.deal
    end
  end

  describe '#show_all_hands' do
    it 'prints out all players hands' do
      player_hand = ['Ace of Diamonds', 'Queen of Hearts']
      player1 = double(:player, show_hand: player_hand)
      players_array = [player1]
      game = Game.new(mock_deck, players_array)
      player_header = 'Player 1 hand'
      end_of_hand = '----------'
      expect(STDOUT).to receive(:puts).with(player_header)
      expect(STDOUT).to receive(:puts).with(player_hand)
      expect(STDOUT).to receive(:puts).with(end_of_hand)
      game.show_all_hands
    end
  end
end
