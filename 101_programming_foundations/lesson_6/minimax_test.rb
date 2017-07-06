# minimax_test.rb
require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

# Does not modify the real board
def try_move(board, square, new_marker)
  new_board = {}
  board.each do |num, current_marker|
    if num == square
      new_board[square] = new_marker
    else
      new_board[num] = current_marker
    end
  end
  new_board
end

def board_full?(board)
  empty_squares(board).empty?
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if line.all? { |sqr| board[sqr] == PLAYER_MARKER }
      return PLAYER_MARKER
    elsif line.all? { |sqr| board[sqr] == COMPUTER_MARKER }
      return COMPUTER_MARKER
    end
  end
  nil
end

def someone_won?(board)
  !!detect_winner(board)
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

# The maximizing player starts
def minimax(starting_state, max_player = COMPUTER_MARKER, min_player = PLAYER_MARKER)
  values_of_next_possible_moves = {}
  
  empty_squares(starting_state).each do |move|
    state = try_move(starting_state, move, max_player)
    value = minimax_value(state, min_player, max_player, min_player)
    values_of_next_possible_moves[value] = move
  end

  optimal_value = values_of_next_possible_moves.keys.max
  return values_of_next_possible_moves[optimal_value]
end

def minimax_value(current_state, current_player, max_player, min_player)
  return assess(current_state, max_player, min_player) if terminal?(current_state)
  
  possible_moves = empty_squares(current_state)
  
  if current_player == max_player
    value = -2
    possible_moves.each do |move|
      state = try_move(current_state, move, current_player)
      value = [value, minimax_value(state, min_player, max_player, min_player)].max
    end
      
  else
    value = 2
    possible_moves.each do |move|
      state = try_move(current_state, move, current_player)
      value = [value, minimax_value(state, max_player, max_player, min_player)].min
    end
  end

  return value
end

def terminal?(state)
  someone_won?(state) || board_full?(state)
end

def assess(state, max_player, min_player)
  if detect_winner(state) == max_player
    return 1
  elsif detect_winner(state) == min_player
    return -1
  else
    return 0
  end
end

board = initialize_board
board = try_move(board, 1, 'O')
board = try_move(board, 3, 'X')
board = try_move(board, 4, 'X')
board = try_move(board, 5, 'X')
board = try_move(board, 7, 'O')
p board
p minimax(board)
puts "Should be: 6"

board = initialize_board
board = try_move(board, 1, 'X')
board = try_move(board, 3, 'O')
board = try_move(board, 4, 'O')
board = try_move(board, 7, 'O')
board = try_move(board, 8, 'X')
board = try_move(board, 9, 'X')
p board
p minimax(board)
puts "Should be: 5"

board = initialize_board
p minimax(board)