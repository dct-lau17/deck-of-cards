require 'game'

RSpec.describe Game do
  let(:mock_deck) { double(:deck) }
  let(:mock_player_instance) { double(:player_instance) }
  let(:mock_player_class) { double(:player_class, new: mock_player_instance) }
  subject(:game) { described_class.new(mock_deck, mock_player_class) }

  describe '#default' do
    it 'has a deck of cards' do
      expect(game.deck).to eq mock_deck
    end

    it 'initiates with 4 players' do
      p game.players
      expect(game.players.length).to eq 4
    end
  end

end
