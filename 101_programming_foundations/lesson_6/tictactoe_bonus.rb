# 101 Lesson 6: Tic Tac Toe Bonus Features

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

FIRST_PLAYER = :choose # :player, :computer, :choose
DIFFICULTY = :choose # :easy, :hard, :impossible, :choose

WINNING_SCORE = 5
SIDE_LENGTH = 3

#---UI methods---#

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('cls') || system('clear')
end

def joiner(array, delimiter = ', ', conjunction = 'or')
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{conjunction} ")
  else
    last_item = delimiter + "#{conjunction} #{array.last}"
    array[0..-2].join(delimiter) + last_item
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
  return FIRST_PLAYER unless FIRST_PLAYER == :choose

  answer = input("Do you want to go first? (y or n)", %w[y yes n no])
  answer.start_with?('y') ? PLAYER_MARKER : COMPUTER_MARKER
end

def disable_hardest_difficulty?
  SIDE_LENGTH > 3
end

def user_inputs_difficulty
  if disable_hardest_difficulty?
    message = 'easy (e) or hard (h)'
    options = %w[e easy h hard]
  else
    message = 'easy (e), hard (h), or impossible (i)'
    options = %w[e easy h hard i impossible]
  end

  prompt("Choose your difficulty: ")
  answer = input(message, options)

  case answer.chr
  when 'e' then :easy
  when 'h' then :hard
  when 'i' then :impossible
  end
end

def decide_difficulty
  difficulty = if DIFFICULTY == :choose
                 user_inputs_difficulty
               else
                 DIFFICULTY
               end

  if difficulty == :impossible && disable_hardest_difficulty?
    prompt("'Impossible' difficulty disabled on boards greater than 3x3.")
    difficulty = user_inputs_difficulty
  end

  difficulty
end

def draw_square(row_numbers, board)
  top = ''
  middle = ''
  bottom = ''

  row_numbers.each do |num|
    top += num.to_s + (' ' * (5 - num.to_s.size)) + '|'
    middle += "  #{board[num]}  |"
    bottom += '     |'
  end

  puts top.chomp('|')
  puts middle.chomp('|')
  puts bottom.chomp('|')
end

def draw_border(size)
  puts '-----' * (size - 1) + '-----'
end

def display_board(board)
  rows = rows()
  last_row = rows.pop

  clear_screen
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."

  rows.each do |row|
    draw_square(row, board)
    draw_border(SIDE_LENGTH)
  end
  draw_square(last_row, board)
end

def display_score(score)
  score.each { |player, value| puts "#{player}: #{value}" }
end

def display_outcome(winner, board, winning_lines)
  if someone_won?(board, winning_lines)
    prompt "#{winner} won!"
  else
    prompt "It's a tie!"
  end
end

def display_game_winner(winner)
  puts("--------------------------")
  prompt("#{winner} won the game!")
end

#---Game methods---#

def rows
  num_squares = SIDE_LENGTH**2

  (1..num_squares).each_slice(SIDE_LENGTH).to_a
end

def columns(rows)
  rows.map.with_index do |row, outer_index|
    row.map.with_index { |_, inner_index| rows[inner_index][outer_index] }
  end
end

def diagonals
  num_squares = SIDE_LENGTH**2
  diagonals = []

  diagonals << (1..num_squares).step(SIDE_LENGTH + 1).to_a
  diagonals << (SIDE_LENGTH..num_squares - 1).step(SIDE_LENGTH - 1).to_a

  diagonals
end

def calculate_winning_lines
  rows + columns(rows) + diagonals
end

def new_board
  board = {}
  (1..SIDE_LENGTH**2).each { |num| board[num] = INITIAL_MARKER }
  board
end

def update_score(score, winner)
  score[winner] += 1
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def center_square
  (SIDE_LENGTH**2 + 1) / 2
end

def choose_center_square_if_available(board)
  center_square if square_empty?(board, center_square)
end

def square_empty?(board, square)
  empty_squares(board).include?(square)
end

def board_empty?(board)
  empty_squares(board).size == SIDE_LENGTH**2
end

def board_full?(board)
  empty_squares(board).empty?
end

def find_threatened_square(board, marker, winning_lines)
  winning_lines.each do |line|
    squares_in_line = board.values_at(*line)
    num_marker_squares = squares_in_line.count(marker)
    num_empty_squares = squares_in_line.count(INITIAL_MARKER)

    if num_marker_squares == (SIDE_LENGTH - 1) && num_empty_squares == 1
      empty_square_index = squares_in_line.index(INITIAL_MARKER)
      return line[empty_square_index]
    end
  end

  nil
end

def choose_random_square(board)
  empty_squares(board).sample
end

def find_best_move(board, winning_lines)
  find_threatened_square(board, COMPUTER_MARKER, winning_lines) ||
    find_threatened_square(board, PLAYER_MARKER, winning_lines) ||
    choose_center_square_if_available(board) ||
    choose_random_square(board)
end

def alternate_player(current_player)
  current_player == PLAYER_MARKER ? COMPUTER_MARKER : PLAYER_MARKER
end

def someone_won?(board, winning_lines)
  !!detect_winner(board, winning_lines)
end

def detect_winner(board, winning_lines)
  winning_lines.each do |line|
    if line.all? { |sqr| board[sqr] == PLAYER_MARKER }
      return PLAYER_MARKER
    elsif line.all? { |sqr| board[sqr] == COMPUTER_MARKER }
      return COMPUTER_MARKER
    end
  end

  nil
end

def place_piece!(board, current_player, winning_lines, difficulty)
  case current_player
  when PLAYER_MARKER
    player_places_piece!(board)
  when COMPUTER_MARKER
    computer_places_piece!(board, winning_lines, difficulty)
  end
end

def player_places_piece!(board)
  options = empty_squares(board).map(&:to_s)
  square = input("Choose a square (#{joiner(options)}):", options).to_i

  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board, winning_lines, difficulty)
  square = case difficulty
           when :impossible
             prompt "Computer is thinking..."
             # Minimax is slow on > 8 squares; choose center square
             # if board is empty (i.e., computer starts).
             board_empty?(board) ? center_square : minimax(board, winning_lines)
           when :hard
             find_best_move(board, winning_lines)
           when :easy
             choose_random_square(board)
           end

  board[square] = COMPUTER_MARKER
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

def end_of_game?(board, winning_lines)
  someone_won?(board, winning_lines) || board_full?(board)
end

#---AI/minimax methods---#

def assess(winner, max_player, min_player)
  case winner
  when max_player then 1
  when min_player then -1
  else 0
  end
end

def maximize_score(next_possible_board_states, players, winning_lines)
  score = -2
  min_player = players.last

  next_possible_board_states.each do |next_state|
    next_score = minimax_score(next_state, min_player, players, winning_lines)
    score = [score, next_score].max
  end

  score
end

def minimize_score(next_possible_board_states, players, winning_lines)
  score = 2
  max_player = players.first

  next_possible_board_states.each do |next_state|
    next_score = minimax_score(next_state, max_player, players, winning_lines)
    score = [score, next_score].min
  end

  score
end

def minimax_score(board, current_player, players, winning_lines)
  max_player = players.first
  min_player = players.last

  if end_of_game?(board, winning_lines)
    winner = detect_winner(board, winning_lines)
    return assess(winner, max_player, min_player)
  end

  available_moves = empty_squares(board)
  next_possible_board_states = available_moves.map do |move|
    try_move(board, move, current_player)
  end

  if current_player == max_player
    maximize_score(next_possible_board_states, players, winning_lines)
  else
    minimize_score(next_possible_board_states, players, winning_lines)
  end
end

def minimax(start_state, winning_lines)
  max_player = COMPUTER_MARKER
  min_player = PLAYER_MARKER
  players = [max_player, min_player]

  available_first_moves = empty_squares(start_state)
  minimaxed_scores = {}

  next_possible_board_states = available_first_moves.map do |move|
    next_state = try_move(start_state, move, max_player)
    [next_state, move]
  end

  next_possible_board_states.each do |next_state, move|
    score = minimax_score(next_state, min_player, players, winning_lines)
    minimaxed_scores[score] = move
  end

  optimal_score = minimaxed_scores.keys.max
  minimaxed_scores[optimal_score]
end

#---Main---#

def play_round(winning_lines, first_player, difficulty)
  board = new_board
  current_player = first_player

  loop do
    display_board(board)
    place_piece!(board, current_player, winning_lines, difficulty)
    current_player = alternate_player(current_player)
    break if end_of_game?(board, winning_lines)
  end

  display_board(board)
  board
end

def game_winner?(winner, scores)
  scores[winner] == WINNING_SCORE
end

loop do # game loop
  clear_screen

  scores = { PLAYER_MARKER => 0, COMPUTER_MARKER => 0 }
  winning_lines = calculate_winning_lines
  difficulty = decide_difficulty
  first_player = decide_first_player

  clear_screen

  loop do # round loop
    board = play_round(winning_lines, first_player, difficulty)

    winner = detect_winner(board, winning_lines)
    display_outcome(winner, board, winning_lines)

    update_score(scores, winner) if winner
    display_score(scores)

    if game_winner?(winner, scores)
      display_game_winner(winner)
      break
    else
      continue = input('Continue? (y or n)', %w[y yes n no])
      break if continue.start_with?('n')
    end
  end

  restart = input('Start a new game? (y or n)', %w[y yes n no])
  break if restart.start_with?('n')
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'
