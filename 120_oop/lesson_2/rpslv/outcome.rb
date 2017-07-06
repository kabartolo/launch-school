require_relative 'displayable'

class Outcome
  include Displayable

  attr_reader :human_move

  def initialize(human_move, computer_move, winner)
    @human_move = human_move
    @computer_move = computer_move
    @winner = winner
  end

  def display(human, computer)
    puts "\n#{human} chose #{human_move}."
    puts "#{computer} chose #{@computer_move}."
    if no_winner?
      prompt("It's a tie!")
    elsif human_won?
      prompt("#{human} won!")
    else
      prompt("#{computer} won!")
    end
  end

  def human_won?
    return false if no_winner?
    @winner.human?
  end

  def no_winner?
    @winner.nil?
  end
end
