require 'game'

RSpec.describe 'Feature Test' do
  subject(:game) { Game.new }

  describe '#defaults' do
    it 'initiates with a full deck of cards' do
      expect(game.deck.cards.length).to eq 52
    end

    it 'initiates with 4 players' do
      expect(game.players.length).to eq 4
    end
  end
end
