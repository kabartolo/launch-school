class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

def Human < Player
	def choose_square(empty_squares)
		options = empty_squares.map(&:to_s)
	  input("Choose a square (#{joiner(options)}):", options).to_i
	end
end

class Computer < Player
	include Minimax
	
  def choose_square(difficulty, empty_squares)
		case difficulty
	  when :impossible
	    prompt "Computer is thinking..."
	    board_empty?(board) ? center_square : minimax(board, winning_lines)
	  when :hard
	    find_best_move(board, winning_lines)
	  when :easy
	    choose_random_square(board)
    end
	end

	private

	def choose_random_square(board)
	  empty_squares(board).sample
	end

	def find_best_move(board, winning_lines)
	  find_threatened_square(board, COMPUTER_MARKER, winning_lines) ||
	    find_threatened_square(board, PLAYER_MARKER, winning_lines) ||
	    choose_center_square_if_available(board) ||
	    choose_random_square(board)
	end
end
