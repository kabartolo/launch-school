# Advanced 3: Transpose 3x3  (9 May 2017)

# A 3 x 3 matrix can be represented by an Array of Arrays in which the
# main Array and all of the sub-Arrays has 3 elements. For example:

# 1  5  8
# 4  7  2
# 3  9  6

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# The transpose of a 3 x 3 matrix is the matrix that results from exchanging the
# columns and rows of the original matrix. For example, the transposition of the
# array shown above is:

# 1  4  3
# 5  7  9
# 8  2  6

# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the
# transpose of the original matrix. Note that there is a Array#transpose method that
# does this -- you may not use it for this exercise. You also are not allowed to use
# the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and
# leave the original matrix unchanged.

# This is limited to matrices with equal number rows and columns
def transpose(matrix)
  matrix.map.with_index do |row, row_index|
    row.map.with_index { |_, col_index | matrix[col_index][row_index] }
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


def transpose!(matrix)
  matrix_copy = matrix.dup

  matrix.map!.with_index do |row, row_index|
    row.map.with_index { |_, col_index | matrix_copy[col_index][row_index] }
  end
end

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

def transpose(matrix)
  matrix.first.zip(*matrix.drop(1))
end