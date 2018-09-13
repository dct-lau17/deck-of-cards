require 'card'

RSpec.describe Card do
  subject(:card) { described_class.new('Ace') }
  it 'can record the value of a card' do
    expect(card.value).to eq 'Ace'
  end
end
