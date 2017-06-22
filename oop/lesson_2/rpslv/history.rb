require_relative 'outcome'

class History
  attr_accessor :list_of_outcomes, :repeat_count, :change_count

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

  def detect_human_strategy
    if human_repeating? && win_ratio(num_outcomes: 3) >= WIN_RATIO_GOAL
      :repeat
    elsif human_changing? && win_ratio(num_outcomes: 3) >= WIN_RATIO_GOAL
      :change
    end
  end

  def display_all(human_name, computer_name)
    list_of_outcomes.each do |outcome|
      outcome.display(human_name, computer_name)
    end
  end

  def display_last_outcome(human_name, computer_name)
    last_outcome.display(human_name, computer_name)
  end

  def reset
    self.list_of_outcomes = []
  end

  private

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
      self.repeat_count += 1
      self.change_count = 0
    else
      self.change_count += 1
      self.repeat_count = 0
    end
  end

  def win_ratio(num_outcomes: 3)
    last_n_outcomes = list_of_outcomes.reverse.take(num_outcomes)
    wins = last_n_outcomes.count(&:human_won?)
    wins.fdiv(last_n_outcomes.size)
  end
end
