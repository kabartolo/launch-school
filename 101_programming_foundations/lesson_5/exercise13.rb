# 101 Lesson 5: Exercises (27 March 2017)
# Exercise 13

# Given the following data structure, return a new array containing the
# same sub-arrays as the original but ordered logically according to
# the numeric value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# The sorted array should look like this:

[[1, 8, 3], [1, 6, 7], [1, 4, 9]]

def sort_by_odd(arr)
  arr.sort_by do |sub_array|
    sub_array.select do |item|
      item.odd?
    end
  end
end

p sort_by_odd(arr)
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr = [[1, 7, 6], [3, 4, 9], [1, 8, 3]]
p sort_by_odd(arr)
# => [[1, 8, 3], [1, 7, 6], [3, 4, 9]]
