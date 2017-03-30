# Easy 1: Exercise 9: Sum of Digits (March 30, 2017)

# Write a method that takes one argument, a positive integer,
# and returns the sum of its digits.

# Without basic looping constructs (while, until, loop, each)
def sum(num)
  num.to_s.chars.reduce(0) { |total, num| total + num.to_i }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Launch School solution
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end