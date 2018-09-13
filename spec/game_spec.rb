require 'game'

RSpec.describe 'Feature Test' do
  let(:mock_deck) { double(:deck) }
  subject(:game) { Game.new(mock_deck) }

  it 'has a deck of cards' do
    expect(game.deck).to eq mock_deck
  end
end
