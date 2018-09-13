require 'player'

RSpec.describe Player do
  subject(:player) { described_class.new }

  it 'can add a card to the players hand' do
    card = 'Ace of Hearts'
    player.get_card(card)
    expect(player.hand).to include card
  end
end
