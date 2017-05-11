# Advanced 4: Transpose MxN  (9 May 2017)

# In the previous exercise, you wrote a method to transpose
# a 3 x 3 matrix as represented by a ruby Array of Arrays.

# Matrix transposes aren't limited to 3 x 3 matrices, or even
# square matrices. Any matrix can be transposed by simply switching
# columns with rows.

# Modify your transpose method from the previous exercise so it works
# with any matrix with at least 1 row and 1 column.

def transpose(matrix)
  result = []
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |col_index|
    col = []
    matrix.each do |row|
      col << row[col_index]
    end
    result << col
  end

  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]