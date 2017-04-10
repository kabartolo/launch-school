# Easy 4: Exercise 10: Convert a Signed Number to a String (7 April, 2017)

# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available
# in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
# You may, however, use integer_to_string from the previous exercise.

def integer_to_string(number)
  digits = []
  digits << 0 if number == 0

  while number != 0
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
  end

  digits.join
end

def signed_integer_to_string(number)
  string = integer_to_string(number < 0 ? -number : number)
  
  case number <=> 0
  when -1 then "-#{string}"
  when +1 then "+#{string}"
  else string
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
