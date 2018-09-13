require 'deck'

RSpec.describe Deck do
  subject(:deck) { described_class.new }

  it 'generates a deck of cards when initialised' do
    expect(deck.cards.length).to eq 52
  end
end
