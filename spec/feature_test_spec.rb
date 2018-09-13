require 'game'

RSpec.describe Game do
  subject(:game) { described_class.new }

  describe '#defaults' do
    it 'initiates with a full deck of cards' do
      expect(game.deck.cards.length).to eq 52
    end
  end
end
