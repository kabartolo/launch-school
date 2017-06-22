require_relative 'outcome'

class History
  WIN_RATIO_GOAL = 0.6

  def initialize
    @list_of_outcomes = []
    @repeat_count = 0
    @change_count = 0
  end

  def add!(human_move, computer_move, winner)
    new_outcome = Outcome.new(human_move, computer_move, winner)
    update_strategy_counts!(new_outcome)

    list_of_outcomes << new_outcome
  end

  def display_all(human, computer)
    list_of_outcomes.each do |outcome|
      outcome.display(human, computer)
    end
  end

  def display_last_outcome(human, computer)
    last_outcome.display(human, computer)
  end

  def human_strategy
    if human_repeating? && win_ratio(num_outcomes: 3) >= WIN_RATIO_GOAL
      :repeat
    elsif human_changing? && win_ratio(num_outcomes: 3) >= WIN_RATIO_GOAL
      :change
    end
  end

  def last_human_move
    last_outcome&.human_move
  end

  def reset!
    @list_of_outcomes = []
  end

  private

  attr_reader :list_of_outcomes, :repeat_count, :change_count

  def human_changing?
    change_count > 1
  end

  def human_repeating?
    repeat_count > 1
  end

  def first_move?
    last_outcome.nil?
  end

  def last_outcome
    list_of_outcomes.last
  end

  def update_strategy_counts!(new_outcome)
    return if first_move?

    if last_outcome.human_move == new_outcome.human_move
      @repeat_count += 1
      @change_count = 0
    else
      @change_count += 1
      @repeat_count = 0
    end
  end

  def win_ratio(num_outcomes: 3)
    last_n_outcomes = list_of_outcomes.reverse.take(num_outcomes)
    wins = last_n_outcomes.count(&:human_won?)
    wins.fdiv(last_n_outcomes.size)
  end
end
