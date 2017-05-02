# Easy 9: Exercise 5: Uppercase Check (20 April 2017)

# Write a method that takes a string argument, and returns
# true if all of the alphabetic characters inside the string
# are uppercase, false otherwise. Characters that are not
# alphabetic should be ignored.

def uppercase?(string)
  string.each_char do |char|
    return false if char.upcase != char
  end

  return true
end

def uppercase?(string)
  string.upcase == string
end

def uppercase?(string)
  string.chars.all? { |char| char == char.upcase }
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true