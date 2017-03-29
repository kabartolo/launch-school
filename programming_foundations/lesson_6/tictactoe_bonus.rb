# 101 Lesson 6: Tic Tac Toe Bonus Features (28 March 2017)
require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

FIRST_PLAYER = 'choose' # player, computer, or choose
DIFFICULTY = 'impossible' # easy, hard, impossible, or choose

SIZE = 3

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, delimiter = ', ', conjunction = 'or')
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{conjunction} ")
  else
    result = array[0..-2].join(delimiter) + delimiter
    result += "#{conjunction} #{array.last}"
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system('cls') || system('clear')
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ''
  puts '1    |2    |3'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '4    |5    |6'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '7    |8    |9'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/AbcSize

def decide_first_player
  return FIRST_PLAYER unless FIRST_PLAYER == 'choose'
  loop do
    prompt "Who should go first? ('me' / 'computer')"
    answer = gets.chomp.downcase
    return PLAYER_MARKER if answer == 'me'
    return COMPUTER_MARKER if answer == 'computer'
    prompt "That is not a valid choice."
  end
end

def alternate_player(current_player)
  if current_player == PLAYER_MARKER
    COMPUTER_MARKER
  elsif current_player == COMPUTER_MARKER
    PLAYER_MARKER
  end
end

def update_score(score, winner)
  score[winner] += 1
end

def display_score(score)
  score.each do |marker, score|
    puts "#{marker}: #{score}"
  end  
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def find_threatened_square(board, ai)
  marker = COMPUTER_MARKER if ai == 'offensive'
  marker = PLAYER_MARKER if ai == 'defensive'

  WINNING_LINES.each do |line|
    squares = board.values_at(*line)
    if squares.count(marker) == 2 && squares.count(INITIAL_MARKER) == 1
      return line[squares.index(INITIAL_MARKER)]
    end
  end

  nil
end

def center_square(board)
  center = (SIZE**2 + 1) / 2
  return center if empty_squares(board).include?(center) 
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board) # => should return true/false not truthiness
  !!detect_winner(board)
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

#---Minimax methods---#
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

#---Play methods---#

def place_piece!(board, current_player)
  if current_player == PLAYER_MARKER
    player_places_piece!(board)
  elsif current_player == COMPUTER_MARKER
    computer_places_piece!(board)
  end
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  if empty_squares(board).size == board.size
    square = center_square(board)
  # square = find_threatened_square(board, 'offensive') ||
  #          find_threatened_square(board, 'defensive') ||
  #          center_square(board) ||
  else
    square =  minimax(board)
  end

  board[square] = COMPUTER_MARKER
end

#---Game start---#

loop do # game loop
  score = { PLAYER_MARKER => 0, COMPUTER_MARKER => 0 }
  first_player = decide_first_player

  system('cls') || system('clear')

  loop do # round loop
    board = initialize_board
    current_player = first_player

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    winner = detect_winner(board)
    if someone_won?(board)
      prompt "#{winner} won!"
      update_score(score, winner)
    else
      prompt "It's a tie!"
    end

    display_score(score)

    if score[winner] == 5
      prompt "Game over! #{winner} wins the game!"
      break
    end

    prompt 'Continue? (y or n)'
    answer = gets.chomp
    break unless answer.downcase == 'y'
  end

  prompt 'Do you want to start a new game? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'

#Test Cases
joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
