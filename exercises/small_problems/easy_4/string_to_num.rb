# Easy 4: Exercise 7: Convert a String to a Number (6 April 2017)

# The String#to_i method converts a string of numeric characters (including an
# optional plus or minus sign) to an Integer. String#to_int and Integer behave
# similarly. In this exercise, you are going to create your own conversion method.

# Write a method that takes a String of digits, and returns the appropriate number
# as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such
# as String#to_i, Integer(), etc. Your method should do this the old-fashioned way
# and calculate the result by analyzing the characters in the string.

DECIMALS = ('0'..'9').to_a.zip(0..9).to_h
HEXADECIMALS = DECIMALS.merge(('A'..'F').to_a.zip(10..15).to_h)

def string_to_num(string, base = 10)
  digits = string.split('').map(&:upcase).reverse
  conversion_table = case base
                     when 10 then DECIMALS
                     when 16 then HEXADECIMALS
                     end
  
  digits.each_with_index.inject(0) do |sum, (digit, index) | 
    sum += conversion_table[digit]*(base**index)
  end
end

puts string_to_num('4321') == 4321
puts string_to_num('570') == 570
puts string_to_num('4D9f', 16) == 19871
