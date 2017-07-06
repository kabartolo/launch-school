# 101 Lesson 2: RPS (20 March 2017)
# Assignment: Rock Paper Scissors: Bonus Features

VALID_CHOICES = { 'r' => 'rock',
                  'p' => 'paper',
                  's' => 'scissors',
                  'l' =>  'lizard',
                  'v' =>  'spock' }

OUTCOME_TABLE = { 'rock' => %w(scissors lizard),
                  'paper' => %w(rock spock),
                  'scissors' => %w(paper lizard),
                  'lizard' => %w(paper spock),
                  'spock' => %w(rock scissors) }

GAME_NAME = "Rock Paper Scissors Lizard Spock"
WINNING_SCORE = 5

#---Helper methods---#

def prompt(message)
  Kernel.puts("=> #{message}\n")
end

def clear_screen
  system('clear') || system('cls')
end

def user_input_name
  loop do
    prompt('What is your name?')
    name = gets.chomp
    return name if /^\w+/.match(name)
    prompt('Not a valid name.')
  end
end

def user_choose_move
  loop do
    prompt("Enter a letter:")
    prompt("(Ctrl + c to exit)")
    display_table(VALID_CHOICES)

    choice = gets.chomp.downcase

    if VALID_CHOICES[choice]
      return VALID_CHOICES[choice]
    elsif VALID_CHOICES.value?(choice)
      return choice
    end

    prompt("That's not a valid choice.")
  end
end

def win?(choice1, choice2)
  OUTCOME_TABLE[choice1].include?(choice2)
end

def winner(player, computer, player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    player
  elsif win?(computer_choice, player_choice)
    computer
  end
end

def update_score(player, scores, points)
  scores[player] += points
end

def display_table(table)
  table.each { |label, value| puts " | #{label}: #{value}" }
end

def display_welcome(player, game_name, winning_score)
  prompt("Hello, #{player}!")
  prompt("Welcome to #{game_name}.")
  prompt("First to a score of #{winning_score} wins!")
end

def display_chosen_moves(player_choice, computer_choice)
  prompt("You chose: #{player_choice.upcase}")
  prompt("Computer chose: #{computer_choice.upcase}")
end

def display_winner(winner, player, computer)
  prompt case winner
         when player then "#{player.upcase} WON!"
         when computer then "#{computer.upcase} WON!"
         else "IT'S A TIE!"
         end
end

def display_scores(scores)
  display_table(scores)
end

def play_again?
  loop do
    prompt("Game over. Do you want to play again? y/n")
    exit = gets.chomp.downcase
    return exit if exit.start_with?('y', 'n')
    prompt("Enter 'y' or 'n'.")
  end
end

#---Game start---#

player = user_input_name()
computer = 'Computer'

clear_screen
display_welcome(player, GAME_NAME, WINNING_SCORE)
puts("\n")

loop do # main game
  scores = { player => 0, computer => 0 }

  loop do # game round
    player_choice = user_choose_move
    computer_choice = VALID_CHOICES.values.sample

    clear_screen
    display_chosen_moves(player_choice, computer_choice)
    puts("\n")

    winner = winner(player, computer, player_choice, computer_choice)
    update_score(winner, scores, 1) if winner

    display_winner(winner, player, computer)
    puts("\n")
    display_scores(scores)
    puts("-" * 27)

    if scores[winner] == WINNING_SCORE
      prompt("#{winner.capitalize} won the game!")
      break
    end
  end

  #---Game over----#
  play_again_answer = play_again?()
  clear_screen
  break unless play_again_answer.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")

#---Test cases---#
# player1 = 'player1'
# player2 = 'player2'
# outcomes = { "rock" => "scissors", "scissors" => "paper", "paper" => "rock" }
# scores = { player1 => 0, player2 => 0 }

# puts "All test cases should evaluate to true"

# puts win?('rock', 'scissors', outcomes) == true
# puts win?('paper', 'scissors', outcomes) == false
# puts win?('scissors', 'paper', outcomes) == true
# puts win?('scissors', 'scissors', outcomes) == false

# update_score(player1, scores, 1)
# puts scores == { player1 => 1, player2 => 0}
# update_score(player2, scores, 2)
# puts scores == { player1 => 1, player2 => 2}
# update_score(player2, { player1 => 4, player2 => 4 }, 2)
# puts scores == { player1 => 1, player2 => 2 }
