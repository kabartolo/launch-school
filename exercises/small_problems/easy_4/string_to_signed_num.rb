# Easy 4: Exercise 8: Convert a String to a Signed Number (6 April 2017)

# In the previous exercise, you developed a method that converts simple
# numeric strings to Integers. In this exercise, you're going to extend
# that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading + or - sign; if the first
# character is a +, your method should return a positive number; if it is a -,
# your method should return a negative number. If no sign is given, you should
# return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. You may, however, use the string_to_integer
# method from the previous lesson.

DECIMALS = ('0'..'9').to_a.zip(0..9).to_h
HEXADECIMALS = DECIMALS.merge(('A'..'F').to_a.zip(10..15).to_h)

def string_to_num(string, base = 10)
  digits = string.split('').map(&:upcase).reverse
  conversion_table = case base
                     when 10 then DECIMALS
                     when 16 then HEXADECIMALS
                     end
  
  digits.each_with_index.inject(0) do | sum, (digit, index) | 
    sum += conversion_table[digit]*(base**index)
  end
end

def string_to_signed_num(string, base = 10)
  alpha_num_only = string[/\w+/]
  string_to_num(alpha_num_only, base) * (string[0] == '-' ? -1 : 1)
end

puts string_to_signed_num('4321') == 4321
puts string_to_signed_num('570') == 570
puts string_to_signed_num('4D9f', 16) == 19871
puts string_to_signed_num('-570') == -570
puts string_to_signed_num('+100') == 100

