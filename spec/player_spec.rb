require 'player'

RSpec.describe Player do
  subject(:player) { described_class.new }

  before(:each) do
    @card1 = double(:card, show_card: 'Ace of Hearts')
    @card2 = double(:card, show_card: 'Two of Hearts')
    player.get_card(@card1)
    player.get_card(@card2)
  end

  it 'can add a card to the players hand' do
    expect(player.hand).to include @card1
    expect(player.hand).to include @card2
  end

  it 'can show the cards in the players hand' do
    expected_output = [@card1.show_card, @card2.show_card]
    expect(player.show_hand).to eq expected_output
  end
end
