# Exercises: 120 Object-Oriented Programming: Medium 1
# 16 June 2017
# Exercise 9

# Deck of Cards

# Using the Card class from the previous exercise, create a Deck class that contains
# all of the standard 52 playing cards. Use the following code to start your work:
require 'pry'
class Card
  include Comparable

  RANK_VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUIT_VALUES = { 'Diamonds' => 1, 'Hearts' => 2, 'Clubs' => 3, 'Spades' => 4 }
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
  	value <=> other.value 
  end

  def value
  	RANK_VALUES.fetch(rank, rank)
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
  	reset_deck
  end

  def draw
  	reset_deck if @cards.empty?
  	@cards.pop
  end

  private

  def new_card(rank, suit)
  	Card.new(rank, suit)
  end

  def reset_deck
  	@cards = new_shuffled_deck
  end

  def new_shuffled_deck
  	RANKS.product(SUITS).map { |rank, suit| new_card(rank, suit) }.shuffle
  end
end

# The Deck class should provide a #draw method to draw one card at random. If the deck
# runs out of cards, the deck should reset itself by generating a new set of 52 cards.

# Examples:

# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# puts drawn.count { |card| card.rank == 5 } == 4
# puts drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# puts drawn != drawn2 # Almost always.

# Note that the last line should almost always be true; if you shuffle the deck
# 1000 times a second, you will be very, very, very old before you see two
# consecutive shuffles produce the same results. If you get a false result,
# you almost certainly have something wrong.