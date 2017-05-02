# Easy 7: Exercise 10: The End is Near But Not Here (20 April 2017)

# Write a method that returns the next to last word in the String passed
# to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Write a method that returns the middle word of a phrase
# or sentence. It should handle all edge cases.

def middle_word(string)
  words = string.split
  return string if string.empty? || words.size == 1

  words[words.size / 2]
end

p middle_word('') == ''
p middle_word('last word') == 'word'
p middle_word('Launch School is great!') == 'is'
p middle_word('Launch School is so great!') == 'is'
