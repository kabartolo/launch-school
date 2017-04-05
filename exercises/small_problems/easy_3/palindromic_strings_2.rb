# Easy 3: Exercise 8: Palindromic Strings 2 (5 April 2017)

# Write another method that returns true if the string
# passed as an argument is a palindrome, false otherwise.
# This time, however, your method should be case-insensitive,
# and it should ignore all non-alphanumeric characters. If
# you wish, you may simplify things by calling the palindrome?
# method you wrote in the previous exercise.

def palindrome?(string)
  string.reverse == string
end

def real_palindrome?(string)
  string = string.downcase.gsub(/\W/, '') # or delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
