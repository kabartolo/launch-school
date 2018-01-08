require 'pry'

class Hand
  def initialize
    @cards = []
  end

  def add(card)
    @cards << card
  end

  def busted?(limit)
    total > limit
  end

  def total
    @cards.map(&:value).reduce(:+)
  end

  def display_all
    @cards.each do |card|
      puts card
    end
  end

  def display_first
    puts @cards.first
    puts "? of ?"
  end
end

class Participant
  attr_reader :hand

  def initialize
    @hand = Hand.new
  end

  def add_to_hand(card)
    @hand.add(card)
  end

  def busted?(limit)
    @hand.busted?(limit)
  end

  def hand_score
    @hand.total
  end
end

class Player < Participant
  def initialize(name)
    super()
    @name = name
  end

  def show_all_cards
    puts "Player Cards"
    @hand.display_all
    puts "Total: #{@hand.total}"
    puts
  end

  def to_s
    @name
  end
end

class Dealer < Participant
  INITIAL_DEAL_NUM_CARDS = 2

  def initialize(deck)
    super()
    @deck = deck
  end

  def deal_to(participant)
    INITIAL_DEAL_NUM_CARDS.times do
      participant.add_to_hand(one_card)
    end
  end

  def hit(participant)
    participant.add_to_hand(one_card)
  end

  def one_card
    @deck.deal_one_card
  end

  def show_all_cards
    puts "Player Cards"
    @hand.display_all
    puts "Total: #{@hand.total}"
    puts
  end

  def show_initial_cards
    puts "Dealer Cards"
    @hand.display_first
    puts
  end

  def stay?(cutoff)
    hand_score >= cutoff
  end

  def to_s
    "Dealer"
  end
end

class Deck
  def initialize
    @cards = new_shuffled_deck
  end

  def deal_one_card
    @cards.pop
  end

  def new_shuffled_deck
    Card::SUITS.product(Card::RANKS).map do |suit, rank|
      Card.new(suit, rank)
    end.shuffle
  end
end

class Card
  SUITS = %w[Diamonds Hearts Spades Clubs]
  RANKS = (2..10).to_a + %w[Jack Queen King Ace]
  VALUES = (2..14).to_a

  attr_reader :value

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @value = VALUES[RANKS.index(rank)]
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end

class Game
  GOAL = 21
  DEALER_CUTOFF = 18

  def initialize
    @deck = Deck.new
    @player = Player.new('Kate')
    @dealer = Dealer.new(@deck)
  end

  def start
    clear_screen
    deal_cards
    play_round
    show_result
  end

  private

  def clear_screen
    system('cls') || system('clear')
  end

  def deal_cards
    @dealer.deal_to(@player)
    @dealer.deal_to(@dealer)
  end

  def dealer_turn
    clear_screen
    puts "Dealer's turn"
    puts "*************"
    show_all_cards
    loop do
      break if @dealer.busted?(GOAL) || @dealer.stay?(DEALER_CUTOFF)
      @dealer.hit(@dealer)
      sleep(1)
      show_all_cards
    end
  end

  def play_round
    show_initial_cards
    player_turn
    dealer_turn unless @player.busted?(GOAL)
  end

  def player_turn
    return if @player.busted?(GOAL)
    loop do
      puts 'Would you like to hit or stay?'
      answer = gets.chomp.downcase
      @dealer.hit(@player) if answer.start_with?('h')
      show_initial_cards
      return if (answer.start_with?('s') || @player.busted?(GOAL))
    end
  end

  def show_all_cards
    clear_screen
    @player.show_all_cards
    @dealer.show_all_cards
  end

  def show_initial_cards
    @player.show_all_cards
    @dealer.show_initial_cards
  end

  def show_result
    if @player.busted?(GOAL)
      puts "#{@player} busted! #{@dealer} wins!"
    elsif @dealer.busted?(GOAL)
      puts "#{@dealer} busted! #{@player} wins!"
    elsif winner
      puts "#{winner} wins!"
    else
      puts "It's a tie!"
    end
  end

  def winner
    if @player.hand_score > @dealer.hand_score
      @player
    elsif @dealer.hand_score > @player.hand_score
      @dealer
    end
  end
end

Game.new.start
