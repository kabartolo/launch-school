# 101 Lesson 6: Tic Tac Toe Bonus Features (28 March 2017)
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

FIRST_PLAYER = 'choose'   # player, computer, or choose
DIFFICULTY = 'choose' # easy, hard, impossible, or choose

WINNING_SCORE = 5
SIZE = 3

#---Input methods---#
def prompt(msg)
  puts "=> #{msg}"
end

def joiner(array, delimiter = ', ', conjunction = 'or')
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{conjunction} ")
  else
    "#{array[0..-2].join(delimiter)} #{conjunction} #{array.last}"
  end
end

def input(message, options)
  prompt message
  loop do
    answer = gets.chomp.downcase
    return answer if options.include?(answer)
    prompt("Please enter #{joiner(options)}.")
  end
end

def decide_first_player
  return FIRST_PLAYER unless FIRST_PLAYER == 'choose'
  
  answer = input("Do you want to go first? (y or n)", %w(y yes n no))
  
  answer.start_with?('y') ? PLAYER_MARKER : COMPUTER_MARKER
end

def decide_difficulty
  return DIFFICULTY unless DIFFICULTY == 'choose'
  
  answer = input("Difficulty: easy (e), hard (h), or impossible (i)", %w(e easy h hard i impossible))
  
  case answer.chr
  when 'e' then 'easy'
  when 'h' then 'hard'
  when 'i' then 'impossible'
  end
end

#---Game methods---#

def calculate_winning_lines
  num_squares = SIZE**2

  rows = (1..num_squares).each_slice(SIZE).to_a
  columns =  rows.map.with_index do |row, outer_index|
    row.map.with_index { |num, inner_index | rows[inner_index][outer_index] }
  end
  diagonal1 = (1..num_squares).each_slice(SIZE + 1).map(&:first)
  diagonal2 = (SIZE...num_squares).each_slice(SIZE - 1).map(&:first)

  rows + columns << diagonal1 << diagonal2
end

def initialize_board
  (1..SIZE**2).each_with_object({}) { |num, new_board| new_board[num] = INITIAL_MARKER }
end

def draw_square(row_squares, brd)
  top = ''
  middle = ''
  bottom = ''

  row_squares.map(&:to_s).each do |num|
    top +=  num + ' '*(5 - num.size) + '|'
    middle += "  #{brd[num.to_i]}  |"
    bottom +=           "     |"
  end
  puts top.chomp('|')
  puts middle.chomp('|')
  puts bottom.chomp('|')
end

def draw_border(size)
  puts '-----+'*(size-1) + '-----'
end

def display_board(brd)
  num_squares = SIZE**2
  rows = (1..num_squares).each_slice(SIZE).to_a
  
  system('cls') || system('clear')
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  
  rows[0..-2].each do |row| 
    draw_square(row, brd)
    draw_border(SIZE)
  end
  draw_square(rows.last, brd)
end

def alternate_player(current_player)
  current_player == PLAYER_MARKER ? COMPUTER_MARKER : PLAYER_MARKER
end

def update_score(score, winner)
  score[winner] += 1
end

def display_score(score)
  score.each { |marker, score| puts "#{marker}: #{score}" }  
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def find_threatened_square(board, ai)
  winning_lines = calculate_winning_lines()
  marker = COMPUTER_MARKER if ai == 'offensive'
  marker = PLAYER_MARKER if ai == 'defensive'

  winning_lines.each do |line|
    squares = board.values_at(*line)
    if squares.count(marker) == (SIZE - 1) && squares.count(INITIAL_MARKER) == 1
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
  winning_lines = calculate_winning_lines
  
  winning_lines.each do |line|
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

def place_piece!(board, current_player, difficulty)
  case current_player
  when PLAYER_MARKER then player_places_piece!(board)
  when COMPUTER_MARKER then computer_places_piece!(board, difficulty)
  end
end

def player_places_piece!(board)
  options = empty_squares(board).map(&:to_s)
  square = input("Choose a square (#{joiner(options)}):", options).to_i
  
  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board, difficulty)
  square = case difficulty 
           when 'impossible'
             prompt "Computer is thinking..."
             # Shortcut note: minimax is slow on >8 squares and computer always chooses 9
             # when it has the first move on a 3x3 grid.
             empty_squares(board).size == board.size ? SIZE**2 : minimax(board)
           when 'hard'
             find_threatened_square(board, 'offensive') ||
             find_threatened_square(board, 'defensive') ||
             center_square(board) ||
             empty_squares(board).sample
           when 'easy'
             empty_squares(board).sample    
           end

  board[square] = COMPUTER_MARKER
end

#---Game start---#

loop do # game loop
  scores = { PLAYER_MARKER => 0, COMPUTER_MARKER => 0 }
  first_player = decide_first_player()
  difficulty = decide_difficulty()
  winning_lines = calculate_winning_lines()

  system('cls') || system('clear')

  loop do # round loop
    board = initialize_board
    current_player = first_player

    loop do
      display_board(board)
      place_piece!(board, current_player, difficulty)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    winner = detect_winner(board)
    if someone_won?(board)
      prompt "#{winner} won!"
      update_score(scores, winner)
    else
      prompt "It's a tie!"
    end

    display_score(scores)

    puts("--------------------------")
      if scores[winner] == WINNING_SCORE
        prompt("#{winner} won the game!")
        break
      else
        continue = input('Continue? (y or n)', %w(y n yes no))
        break if continue.start_with?('n')
      end
  end

  restart = input('Start a new game? (y or n)', %w(y n yes no))
  break if restart.start_with?('n')
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'

#Test Cases
joiner([1, 2])                   # => "1 or 2"
joiner([1, 2, 3])                # => "1, 2, or 3"
joiner([1, 2, 3], '; ')          # => "1; 2; or 3"
joiner([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
