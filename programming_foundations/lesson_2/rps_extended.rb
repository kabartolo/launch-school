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
    return name if name.length < 20
    prompt('Please use fewer than 20 characters.')
  end
end

def user_choose_move(valid_choices)
  loop do
    prompt("Enter a letter:")
    prompt("(Ctrl + c to exit)")
    display_table(valid_choices)

    choice = gets.chomp.downcase

    if valid_choices[choice]
      return valid_choices[choice]
    elsif valid_choices.value?(choice)
      return choice
    end

    prompt("That's not a valid choice.")
  end
end

def win?(choice1, choice2, outcome_table)
  outcome_table[choice1].include?(choice2)
end

def update_score(player, scores, points)
  scores[player] += points
end

def display_table(table)
  table.each { |label, value| puts " | #{label}: #{value}" }
end

def display_welcome(player, winning_score)
  prompt("Hello, #{player}!")
  prompt("Welcome to Rock Paper Scissors Lizard Spock.")
  prompt("First to a score of #{winning_score} wins!")
end

def display_chosen_moves(user_choice, computer_choice)
  prompt("You chose: #{user_choice.upcase}")
  prompt("Computer chose: #{computer_choice.upcase}")
end

def display_winner(winner, player1, player2)
  prompt case winner
         when player1 then "#{player1.upcase} WON!"
         when player2 then "#{player2.upcase} WON!"
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

PLAYER1 = user_input_name()
PLAYER2 = 'Computer'

WINNING_SCORE = 5

loop do
  scores = { PLAYER1 => 0, PLAYER2 => 0 }
  clear_screen

  display_welcome(PLAYER1, WINNING_SCORE)
  puts("\n")

  loop do
    choice = user_choose_move(VALID_CHOICES)
    computer_choice = VALID_CHOICES.values.sample

    clear_screen
    display_chosen_moves(choice, computer_choice)
    puts("\n")

    winner = if win?(choice, computer_choice, OUTCOME_TABLE)
               PLAYER1
             elsif win?(computer_choice, choice, OUTCOME_TABLE)
               PLAYER2
             end

    update_score(winner, scores, 1) if winner

    display_winner(winner, PLAYER1, PLAYER2)
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
