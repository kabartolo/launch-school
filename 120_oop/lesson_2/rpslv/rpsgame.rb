require_relative 'displayable'
require_relative 'history'
require_relative 'player'

# Game Orchestration Engine
class RPSGame
  include Displayable

  GOAL = 10
  GAME_NAME = 'Rock, Paper, Scissors, Lizard, Spock'.freeze

  attr_reader :history, :human, :computer
  attr_accessor :round_winner

  def initialize
    @history = History.new
    @human = Human.new
    @computer = Computer.create_random_personality(history)
    @round_winner = nil

    display_welcome_message
  end

  def play
    reset_game!

    loop do
      play_round
      update_history
      display_outcome

      update_winner_score
      display_scores

      break display_game_winner if game_winner
      break unless play_again?
      clear
    end

    display_replay if display_replay?
    restart? ? restart : display_goodbye_message
  end

  private

  def detect_winner
    self.round_winner = if human.move > computer.move
                          human
                        elsif computer.move > human.move
                          computer
                        end
  end

  def display_game_winner
    prompt("#{game_winner()} wins the game!")
  end

  def display_goodbye_message
    prompt("Thanks for playing #{GAME_NAME}. Good bye!")
  end

  def display_outcome
    history.display_last_outcome(human, computer)
  end

  def display_replay
    history.display_all(human, computer)
  end

  def display_replay?
    replay_message = 'view a replay of the game? (y or n)'
    replay = user_chooses_option(replay_message, %w[y n yes no])
    replay.start_with?('y')
  end

  def display_scores
    scores = { human => human.score, computer => computer.score }
    puts
    display_table(scores)
    puts
  end

  def display_welcome_message
    clear
    prompt("Hi #{human}. I'm #{computer}.")
    prompt("Welcome to #{GAME_NAME}!\n")
  end

  def game_winner
    if human.score == GOAL
      human
    elsif computer.score == GOAL
      computer
    end
  end

  def play_again?
    play_again = user_chooses_option('play again? (y or n)', %w[y n yes no])
    play_again.start_with?('y')
  end

  def play_round
    human.choose
    computer.choose
    detect_winner
  end

  def reset_game!
    human.reset_score!
    computer.reset_score!
    history.reset!
  end

  def restart
    clear
    play
  end

  def restart?
    restart = user_chooses_option('start a new game? (y or n)', %w[y n yes no])
    restart.start_with?('y')
  end

  def update_history
    history.add!(human.move, computer.move, round_winner)
  end

  def update_winner_score
    round_winner&.add_point!
  end
end

RPSGame.new.play
