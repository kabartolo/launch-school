require_relative 'displayable'
require_relative 'move'

class Player
  attr_reader :move, :name, :score

  VALID_CHOICES = { 'r' => 'rock',
                    'p' => 'paper',
                    's' => 'scissors',
                    'l' =>  'lizard',
                    'v' =>  'spock' }.freeze

  def initialize
    @move = nil
    @name = nil
    @score = 0

    set_name
  end

  def add_point
    @score += 1
  end

  def reset_score
    @score = 0
  end

  private

  def to_s
    name
  end
end

class Human < Player
  include Displayable

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
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      prompt('Sorry, must enter a value.')
    end
    @name = n
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
  NAMES = %w[GlaDOS Bender Data BMO Wall-E R2D2]

  attr_reader :human_strategy, :human_move, :using_strategy

  def initialize
    super
    @possible_moves = VALID_CHOICES.values
    @probabilities =  starting_probabilities

    @using_strategy = false
    @human_strategy = nil
    @human_move = nil
  end

  def adjust_human_strategy(human_strategy, human_move)
    @human_strategy = human_strategy
    @human_move = human_move
  end

  def choose
    adjust_probability
    value = choice_by_probability
    @move = Move.new(value)
  end

  def human?
    false
  end

  def using_strategy?
    using_strategy
  end

  private

  attr_accessor :possible_moves, :probabilities

  def adjust_probability
    case name
    when 'GlaDOS' then use_strategy!
    when 'Data' then use_strategy!
    when 'Bender' then favour_moves!(['scissors'])
    when 'BMO'
      delete_moves!(['spock'])
      favour_moves!(%w[rock paper])
    end
  end

  def choice_by_probability
    cumulative_probabilities = cumulative_sum_array(probabilities.values)
    probability_table = possible_moves.zip(cumulative_probabilities).to_h
    random_number = rand

    probability_table.each do |move, probability|
      return move if random_number < probability || probability == 1.0
    end
  end

  def cumulative_sum_array(num_array)
    sum = 0
    num_array.map { |num| sum += num }
  end

  def delete_moves!(moves)
    possible_moves.delete_if { |current_move, _| moves.include?(current_move) }
    probabilities.delete_if { |current_move, _| moves.include?(current_move) }
    reset_probabilities!
  end

  def equal_probability
    1.0 / possible_moves.size
  end

  def favour_moves!(favourite_moves)
    raise_probabilities!(favourite_moves)
  end

  def lower_probabilities!(bad_moves)
    remaining_moves = possible_moves.reject do |current_move|
      bad_moves.include?(current_move)
    end

    raise_probabilities!(remaining_moves)
  end

  def raise_probabilities!(good_moves)
    remaining_moves = possible_moves.reject do |current_move|
      good_moves.include?(current_move)
    end
    majority_probability = equal_probability * (possible_moves.size - 1)
    remaining_probability = 1.0 - majority_probability

    spread_probability!(good_moves, majority_probability)
    spread_probability!(remaining_moves, remaining_probability)
  end

  def reset_probabilities!
    self.probabilities = starting_probabilities
  end

  def set_name
    @name = NAMES.sample
  end

  def set_probability!(move, probability)
    probabilities[move] = probability
  end

  def spread_probability!(moves, probability)
    prob = probability / moves.size
    moves.each { |current_move| set_probability!(current_move, prob) }
  end

  def starting_probabilities
    possible_moves.zip(Array.new(possible_moves.size, equal_probability)).to_h
  end

  def use_strategy!
    @using_strategy = true
    reset_probabilities!

    if human_strategy == :repeat
      raise_probabilities!(human_move.stronger_moves)
    elsif human_strategy == :change
      lower_probabilities!(human_move.stronger_moves)
    end
  end
end
