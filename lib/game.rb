require_relative 'deck.rb'
require_relative 'player.rb'

class Game
  attr_reader :players, :deck

  def initialize(deck = Deck.new, player_class = Player)
    @deck = deck
    @players = []
    4.times { players << player_class.new }
  end

  def shuffle_deck
    deck.shuffle_deck
  end

  def deal(no_of_cards = 7)
    no_of_cards.times do
      players.each do |player|
        player.get_card(deck.deal)
      end
    end
  end
end
