# Medium 2: Exercise 8: Next Featured Number Higher than a Given Value  (5 May 2017)

# A featured number (something unique to this exercise) is an odd number that is a multiple
# of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number,
# but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not
# (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next
# featured number that is greater than the argument. Issue an error message if
# there is no next featured number.
require 'pry'

def unique_digits?(n)
  n.to_s.chars == n.to_s.chars.uniq
end

def featured(n)
  next_multiple_of_7 = 7 - (n % 7) + n
  next_multiple_of_7 += 7 until next_multiple_of_7.odd?

  loop do
    return "Next featured number not possible." if next_multiple_of_7 >= 9_876_543_210
    return next_multiple_of_7 if unique_digits?(next_multiple_of_7)
    
    next_multiple_of_7 += 14   
  end
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999) == "Next featured number not possible."