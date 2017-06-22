class ProbabilityTable
  attr_reader :moves, :probability_table

  def initialize(moves)
    @moves = moves
    @probability_table = starting_probabilities
  end

  def cumulative_sum_array
    sum = 0
    probability_table.values.map { |num| sum += num }
  end

  def cumulative_table
    moves.zip(cumulative_sum_array).to_h
  end

  def delete_moves!(moves)
    moves.delete_if { |move, _| moves.include?(move) }
    probability_table.delete_if { |move, _| moves.include?(move) }
    reset!
  end

  def equal_probability
    1.0 / moves.size
  end

  def lower!(bad_moves)
    remaining_moves = moves.reject do |current_move|
      bad_moves.include?(current_move)
    end

    raise!(remaining_moves)
  end

  def raise!(good_moves)
    remaining_moves = moves.reject do |current_move|
      good_moves.include?(current_move)
    end
    majority_probability = equal_probability * (moves.size - 1)
    remaining_probability = 1.0 - majority_probability

    spread_probability!(good_moves, majority_probability)
    spread_probability!(remaining_moves, remaining_probability)
  end

  def reset!
    @probability_table = starting_probabilities
  end

  def set_probability!(move, probability)
    probability_table[move] = probability
  end

  def spread_probability!(moves, probability)
    prob = probability / moves.size
    moves.each { |current_move| set_probability!(current_move, prob) }
  end

  def starting_probabilities
    moves.zip(Array.new(moves.size, equal_probability)).to_h
  end
end
