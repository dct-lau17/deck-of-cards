require 'card'

RSpec.describe Card do
  subject(:card) { described_class.new('Ace', 'Hearts') }

  it 'can record the value of a card' do
    expect(card.value).to eq 'Ace'
  end

  it 'can record the suit of a card' do
    expect(card.suit).to eq 'Hearts'
  end

  it 'can show the suit and value of the card' do
    expect(card.show_card).to eq 'Ace of Hearts'
  end
end
