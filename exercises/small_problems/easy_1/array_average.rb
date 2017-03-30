# Easy 1: Exercise 8: Array Average (March 30, 2017)

# Write a method that takes one argument, an array containing integers,
# and returns the average of all numbers in the array. The array will never
# be empty and the numbers will always be positive integers.

def average(array)
  array.reduce(:+) / array.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Verbose version

def average(array)
  result = array.reduce {|total, num| total + num }
  result / array.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Currently, the return value of average is an Integer.
# When dividing numbers, sometimes the quotient isn't a
# whole number, therefore, it might make more sense to
# return a Float. Can you change the return value of average
# from an Integer to a Float?

def average(array)
  array.reduce(:+).to_f / array.size.to_f
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])

# NOTES: 
# In the reduce method above, we could use reduce(&:+) instead.
# The ampersand is used in the last argument of a method call that
# calls the to_proc method on the argument
# [1, 2, 3, 4].reduce(&:+) => [1, 2, 3, 4].reduce(:+.to_proc)

# The ampersand is not necessary in the above example.
# Reduce can just use the reduce(:+) shorthand in this case.
# This is a symbol naming the method to use in the block.
# (This "sym" below)

# reduce(initial, sym) → obj
# reduce(sym) → obj
# reduce(initial) { |memo, obj| block } → obj
# reduce { |memo, obj| block } → obj 