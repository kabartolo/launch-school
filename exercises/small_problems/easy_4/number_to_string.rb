# Easy 4: Exercise 9: Convert a Number to a String (7 April, 2017)

# In the previous two exercises, you developed methods that convert
# simple numeric strings to signed Integers. In this exercise and
# the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and
# converts it to a string representation.

# You may not use any of the standard conversion methods available
# in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your
# method should do this the old-fashioned way and construct the string
# by analyzing and manipulating the number.

def integer_to_string(number)
  digits = []
  digits << 0 if number == 0

  while number != 0
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
  end

  digits.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
puts integer_to_string(1) == '1'
puts integer_to_string(10) == '10'
puts integer_to_string(100) == '100'
puts integer_to_string(05) == '5'

# Array#sort_by! has no non-mutating counterpart
# String#delete is non-mutating (has a #delete! counterpart)
# BUT Array#delete and Hash#delete are mutating