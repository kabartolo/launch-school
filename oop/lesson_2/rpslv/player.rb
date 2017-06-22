require_relative 'displayable'
require_relative 'move'
require_relative 'probability_table'

class Player
  attr_reader :name, :move, :score

  VALID_CHOICES = { 'r' => 'rock',
                    'p' => 'paper',
                    's' => 'scissors',
                    'l' =>  'lizard',
                    'v' =>  'spock' }.freeze

  def initialize
    @name = nil
    @move = nil
    @score = 0
  end

  def add_point!
    @score += 1
  end

  def reset_score!
    @score = 0
  end

  private

  def to_s
    name
  end
end

class Human < Player
  include Displayable

  def initialize
    super
    set_name
  end

  def choose
    loop do
      display_choices
      choice = user_choice

      return @move = Move.new(choice) if valid?(choice)
      prompt('Sorry, invalid choice.')
    end
  end

  def human?
    true
  end

  private

  def display_choices
    puts '----------------'
    puts 'Enter a letter: '
    display_table(VALID_CHOICES)
  end

  def set_name
    loop do
      prompt('What is your name?')
      new_name = gets.chomp
      return @name = new_name if new_name =~ /^\w+/
      prompt('Not a valid name. Please enter a value.')
    end
  end

  def user_choice
    choice = gets.chomp.downcase
    VALID_CHOICES.fetch(choice, choice)
  end

  def valid?(choice)
    VALID_CHOICES.values.include?(choice)
  end
end

class Computer < Player
  NAMES = %w[GlaDOS Wintermute Bender BMO Wall-E R2D2]

  attr_reader :probability_table
  attr_writer :name

  def self.create_random_personality(history)
    new_name = NAMES.sample
    computer = case new_name
               when 'GlaDOS' then AI.new(history)
               when 'Wintermute' then AI.new(history)
               when 'BMO' then BMO.new
               when 'Bender' then Bender.new
               else Computer.new
               end

    computer.name = new_name

    computer
  end

  def initialize
    super
    @probability_table = ProbabilityTable.new(VALID_CHOICES.values)
  end

  def choose
    value = choice_by_probability
    @move = Move.new(value)
  end

  def human?
    false
  end

  private

  def choice_by_probability
    cumulative_prob_table = probability_table.cumulative_table
    random_number = rand

    cumulative_prob_table.each do |move, probability|
      return move if random_number < probability || probability == 1.0
    end
  end

  def delete_moves!(moves)
    probability_table.delete_moves!(moves)
  end

  def favour_moves!(favourite_moves)
    probability_table.raise!(favourite_moves)
  end
end

class AI < Computer
  attr_reader :history

  def initialize(history)
    super()
    @history = history
  end

  def choose
    use_strategy!
    super
  end

  private

  def use_strategy!
    probability_table.reset!

    human_strategy = history.human_strategy
    human_move = history.last_human_move

    if human_strategy == :repeat
      probability_table.raise!(human_move.stronger_moves)
    elsif human_strategy == :change
      probability_table.lower!(human_move.stronger_moves)
    end
  end
end

class Bender < Computer
  def choose
    favour_moves!(['scissors'])
    super
  end
end

class BMO < Computer
  def choose
    delete_moves!(['spock'])
    favour_moves!(%w[rock paper])
    super
  end
end
