require_relative 'deck.rb'
require_relative 'player.rb'

class Game
  attr_reader :players, :deck

  def initialize(deck = Deck.new, player_class = Player)
    @deck = deck
    @players = []
    4.times { players << player_class.new }
  end
end
