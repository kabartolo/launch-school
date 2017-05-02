# Easy 6: Exercise 3: Fibonacci Number Location By Length (18 April 2017)

# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout the
# natural world.

# Computationally, the Fibonacci series is a very simple series, but the result
# grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
# 354,224,848,179,261,915,075 -- that's enormous, especially considering that it
# takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number
# that has the number of digits specified as an argument. (The first Fibonacci number
# has index 1.)

def find_fibonacci_index_by_length(num_digits)
  return 1 if num_digits == 1
  
  series = [1, 1]
  index = 2
  
  while series.last.to_s.size < num_digits
    series << series[-2] + series[-1]
    index += 1
  end

  index
end

puts find_fibonacci_index_by_length(1) == 1
puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
