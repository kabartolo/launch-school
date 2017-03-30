# Easy 1: Exercise 7: Stringy Strings (March 30, 2017)

# Write a method that takes one argument, a positive
# integer, and returns a string of alternating 1s and 0s,
# always starting with 1. The length of the string should
# match the given integer.

def stringy(num)
  result = []
  
  num.times do |num|
    result.last == 1 ? result << 0 : result << 1
  end

  result.join
end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Modify stringy so it takes an optional argument that defaults
# to 1. If the method is called with this argument set to 0, the
# method should return a String of alternating 0s and 1s,
# but starting with 0 instead of 1.

def stringy(num, first = 1)
  first == 1 ? second = 0 : second = 1
  result = []
  
  num.times do |num|
    result.last == first ? result << second : result << first
  end

  result.join
end

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

