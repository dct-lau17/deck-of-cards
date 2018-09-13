require 'game'

RSpec.describe Game do
  let(:card_instance) { double(:card) }
  let(:mock_deck) { double(:deck, deal: card_instance) }
  let(:mock_player_instance) { double(:player_instance) }
  let(:mock_player_class) { double(:player_class, new: mock_player_instance) }
  subject(:game) { described_class.new(mock_deck, mock_player_class) }

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
    it 'deals x amount of cards to players' do
      expect(mock_player_instance).to receive(:get_card).exactly(8).times
      game.deal(2)
    end
  end
end
