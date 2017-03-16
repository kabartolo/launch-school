# Easy 1: 2. Odd

# Write a method that takes one argument in the form of an integer
# or a float; this argument may be either positive or negative. This
# method should check if a number is odd, returning true if its
# absolute value is odd. You may assume that only integers are passed
# in as arguments.

# Assumption:
# Treat 0 as positive (that is, not odd)

def is_odd?(num)
  num % 2 == 1
end

#---Test Cases---#
puts '=> 2 is odd'
puts is_odd?(2)
puts '=> 5 is odd'
puts is_odd?(5)
puts '=> -17 is odd'
puts is_odd?(-17)
puts '=> -8 is odd'
puts is_odd?(-8)
puts '=> 0 is odd'
puts is_odd?(0)
