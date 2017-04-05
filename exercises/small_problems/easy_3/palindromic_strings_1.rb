# Easy 3: Exercise 7: Odd Lists (5 April 2017)

# Write a method that returns true if the string passed
# as an argument is a palindrome, false otherwise. (A palindrome
# reads the same forwards and backwards.) Case matters, and
# all characters should be considered.

def palindrome?(string)
  string.reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Alternative
def palindrome?(string)
  reverse = ''
  string.each_char do |char|
    reverse.prepend(char)
  end
  reverse == string
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Write a method that determines whether or not an array is
# palindromic; that is, the element values appear in the same
# sequence both forwards and backwards in the array. Now
# write a method that determines whether or not an array
# or a string is palindromic; that is, write a method that
# can take either an array or a string argument, and determines
# whether that argument is a palindrome. You may not use an if, unless,
# or case statement or modifier.

def palindrome?(string_or_array)
  string_or_array.reverse == string_or_array
end

p palindrome?([1, 2, 3, 2, 1])
p palindrome?('madam') == true
