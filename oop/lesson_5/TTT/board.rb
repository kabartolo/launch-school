class Board
  attr_reader :squares, :side_length

  def initialize(side_length)
    @squares = {}
    @side_length = side_length
    @winning_lines = calculate_winning_lines
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def draw
    row_squares = rows.map { |row| row.map { |num| @squares[num] } }
    last_row = row_squares.pop

    row_squares.each do |row|
      draw_row(row)
      draw_border(side_length)
    end

    draw_row(last_row)
  end

  def full?
    unmarked_keys.empty?
  end

  def reset
    (1..side_length ** 2).each { |key| @squares[key] = Square.new(key) }
  end

  def someone_won?
    !!winning_marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def winning_marker
    @winning_lines.each do |line|
      line_squares = squares.values_at(*line)
      if three_identical_markers?(line_squares)
        return line_squares.first.marker
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

  private

  attr_reader :side_length

  def draw_row(row_squares)
    top = ''
    middle = ''
    bottom = ''

    squares = row_squares.map(&:format)
    squares.each do |square|
      top += square[:top]
      middle += square[:middle]
      bottom += square[:bottom]
    end

    puts top.chomp('|')
    puts middle.chomp('|')
    puts bottom.chomp('|')
  end

  def draw_border(size)
    puts '-----+' * (size - 1) + '-----'
  end
  
  def rows
    num_squares = side_length**2

    (1..num_squares).each_slice(side_length).to_a
  end

  def columns(rows)
    rows.map.with_index do |row, outer_index|
      row.map.with_index { |_, inner_index| rows[inner_index][outer_index] }
    end
  end

  def diagonals
    num_squares = side_length**2
    diagonals = []

    diagonals << (1..num_squares).step(@side_length + 1).to_a
    diagonals << (side_length..num_squares - 1).step(side_length - 1).to_a

    diagonals
  end

  def calculate_winning_lines
    rows + columns(rows) + diagonals
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end