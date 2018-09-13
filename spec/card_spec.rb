require 'card'

RSpec.describe Card do
  subject(:card) { described_class.new('Ace', 'Heart') }

  it 'can record the value of a card' do
    expect(card.value).to eq 'Ace'
  end

  it 'can record the suit of a card' do
    expect(card.suit).to eq 'Heart'
  end
end
