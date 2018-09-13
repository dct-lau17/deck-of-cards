require 'player'

RSpec.describe Player do
  subject(:player) { described_class.new }
  
  it 'has an array to store the players hand' do
    expect(player.hand).to eq []
  end
end
