# twenty_one.rb

CARD_SUITS = ['hearts', 'diamonds', 'clubs', 'spades']
CARD_VALUES = ('2'..'10').to_a.concat(['J', 'Q', 'K', 'A'])
CARD_SCORES = (2..10).to_a.concat([10, 10, 10, 11])

CARD_SCORE_TABLE = CARD_VALUES.zip(CARD_SCORES).to_h

WINNING_SCORE = 5

GOAL = 21
DEALER_CUTOFF = 17
STARTING_DEAL = 2
GAME_NAME = "Twenty-One"

def prompt(message)
  puts "\n>>#{message}"
end

def user_choose_option(message, options)
  loop do
    prompt("Do you want to #{message}")
    answer = gets.chomp.downcase
    return answer if options.include?(answer)
    prompt("Please enter #{options.join(', ')}")
  end
end

def user_input_name
  loop do
    prompt('What is your name?')
    name = gets.chomp
    return name if /^\w+/.match(name)
    prompt('Not a valid name.')
  end
end

def clear
  system('clr') || system('clear')
end

def initialize_deck
  CARD_VALUES.product(CARD_SUITS)
end

# This mutates the deck AND we're using the returned deleted card.
def deal_random_card!(deck)
  random_card = deck.sample
  deck.delete(random_card)
end

def hit!(hand, deck)
  hand << deal_random_card!(deck)
end

def deal(n, player_hand, dealer_hand, deck)
  n.times do
    hit!(player_hand, deck)
    hit!(dealer_hand, deck)
  end
end

def adjust_score_for_aces(hand, score)
  hand.select { |card| card.first == 'A' }
      .reduce(score) { |total, _| total > GOAL ? total -= 10 : total }
end

def calculate_hand_score(hand)
  score = hand.reduce(0) { |sum, card| sum + CARD_SCORE_TABLE[card.first] }
  adjust_score_for_aces(hand, score)
end

def format_card(card)
  value = card[0]
  suit = card[1]
  "|| #{value} of #{suit} ||"
end

def show_first_card(hand)
  [format_card(hand.first)] + hand[1..-1].map { |_| format_card(['?', '?']) }
end

def show_all_cards(hand)
  hand.map { |card| format_card(card) }
end

def format_player_hand(hand, player)
  ["#{player}'s hand:"] + show_all_cards(hand)
end

def format_dealer_hand(hand, show_one_card_only = false)
  result = ["Dealer's hand:"]

  result += show_one_card_only ? show_first_card(hand) : show_all_cards(hand)
end

def update_display(player_hand, dealer_hand, player, show_one_card_only = false)
  clear

  puts format_dealer_hand(dealer_hand, show_one_card_only)
  puts "Total: #{calculate_hand_score(dealer_hand)}" unless show_one_card_only
  puts
  puts format_player_hand(player_hand, player)
  puts "Total: #{calculate_hand_score(player_hand)}"
end

def wait_for_dealer
  prompt("Dealer is flipping a card...")
  sleep(1)
end

def update_scores(player, scores)
  scores[player] += 1
end

def display_scores(scores)
  puts "\nCurrent score:"
  scores.each { |player, score| puts "| #{player.capitalize}: #{score} |" }
end

def busted?(hand)
  calculate_hand_score(hand) > GOAL
end

def winner(player_hand, dealer_hand, player)
  player_score = calculate_hand_score(player_hand)
  dealer_score = calculate_hand_score(dealer_hand)

  if player_score > dealer_score
    player
  elsif dealer_score > player_score
    :dealer
  end
end

def display_winner(winner, player, someone_busted)
  result = ''
  buster = nil

  if someone_busted
    winner == player ? buster = :dealer : buster = player
    result += "#{buster.capitalize} busts! "
  end

  if winner
    result += "#{winner.capitalize} wins!"    
  else
    result += "It's a tie!"
  end

  prompt(result)
end

def player_turn(hand, dealer_hand, deck, player)
  loop do
    answer = user_choose_option("hit or stay? (h or s)", %w(h s hit stay))

    hit!(hand, deck) if answer.start_with?('h')
    update_display(hand, dealer_hand, player, true)

    break if busted?(hand) || answer.start_with?('s')
  end
end

def dealer_turn(hand, player_hand, deck, player)
  update_display(player_hand, hand, player)
  
  loop do
    score = calculate_hand_score(hand)
    break if score >= DEALER_CUTOFF

    wait_for_dealer
    hit!(hand, deck)
    update_display(player_hand, hand, player)
  end
end

def play_hands(player_hand, dealer_hand, card_deck, player)
  player_turn(player_hand, dealer_hand, card_deck, player)

  if busted?(player_hand)
    :dealer
  else
    dealer_turn(dealer_hand, player_hand, card_deck, player)
    if busted?(dealer_hand)
      player
    else
      winner(player_hand, dealer_hand, player)
    end
  end
end

def play_round(player)
  card_deck = initialize_deck
  player_hand = []
  dealer_hand = []

  deal(STARTING_DEAL, player_hand, dealer_hand, card_deck)

  update_display(player_hand, dealer_hand, player, true)
    
  winner = play_hands(player_hand, dealer_hand, card_deck, player)
  someone_busted = busted?(player_hand) || busted?(dealer_hand)

  display_winner(winner, player, someone_busted)

  winner
end

def main
  clear
  puts "Welcome to #{GAME_NAME}! First to #{WINNING_SCORE} wins!"
  player = user_input_name.capitalize
    
  loop do
    scores = { player => 0, :dealer => 0 }

    loop do
      winner = play_round(player)
      update_scores(winner, scores) if winner
      display_scores(scores)

      puts("--------------------------")
      if scores[winner] == WINNING_SCORE
        prompt("#{winner.capitalize} won the game!")
        break
      else
        play_again = user_choose_option('play again? (y or n)', %w(y n yes no))
        if play_again.start_with?('n')
          break
        end
      end
    end
    
    restart = user_choose_option('start a new game? (y or n)', %w(y n yes no))
    if restart.start_with?('n')
      prompt("Goodbye, #{player}!")
      break
    end
  end
end

main
