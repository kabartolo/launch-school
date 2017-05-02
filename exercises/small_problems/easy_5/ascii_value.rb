# Easy 5: Exercise 1: ASCII String Value (10 April 2017)

# Write a method that determines and returns the ASCII
# string value of a string that is passed in as an argument.
# The ASCII string value is the sum of the ASCII values of
# every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

def ascii_value(string)
  string.chars.map(&:ord).reduce(0, :+)
end

# equivalent to String#sum

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# Alternative (more readable?)

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

# Further exploration

# #chr returns the char for an ascii value when applied to 
# an integer OR the first character when applied to a string
# 's'.ord = 115
# 115.ord = 's'
# 'string.chr = 's'