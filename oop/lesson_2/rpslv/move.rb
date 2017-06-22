class Move
  attr_reader :value

  VALUES = %w[rock paper scissors lizard spock].freeze

  OUTCOME_TABLE = { 'rock' => %w[scissors lizard],
                    'paper' => %w[rock spock],
                    'scissors' => %w[paper lizard],
                    'lizard' => %w[paper spock],
                    'spock' => %w[rock scissors] }.freeze

  def initialize(value)
    @value = value
    @previous_move = nil
  end

  def >(other)
    weaker_moves.include?(other.value)
  end

  def <(other)
    other.weaker_moves.include?(value)
  end

  def ==(other)
    value == other.value
  end

  def stronger_moves
    OUTCOME_TABLE.select { |_, weak_moves| weak_moves.include?(value) }.keys
  end

  def to_s
    @value
  end

  def weaker_moves
    OUTCOME_TABLE[value]
  end
end
