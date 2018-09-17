require_relative 'deck.rb'
require_relative 'player.rb'

class Game
  attr_reader :players, :deck

  def initialize(deck = Deck.new, players = [])
    @deck = deck
    @players = players
    4.times { players << Player.new } if players.empty?
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

  def show_all_hands
    players.each_with_index do |player, index|
      puts "Player #{index + 1} hand"
      puts player.show_hand
      puts '----------'
    end
  end
end

game = Game.new
game.shuffle_deck
game.deal
game.show_all_hands
