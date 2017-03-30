# Easy 1: Exercise 6: Reverse It (Part 2) (March 30, 2017)

# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with all five or more letter words reversed. Each
# string will consist of only letters and spaces. Spaces should be included
# only when more than one word is present.

def reverse_words(sentence)
  result = sentence.split.map do |word|
    word.reverse! if word.size >= 5
    word
  end

  result.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# NOTES
# String has a reverse(!) method (no need to split/join)
# Mapping a string:
# - Given a sentence string
# - Create a new array of words in that string (method: split)
#   - each word in the array is a new object (separate from the original sentence)
# - Map the new array by word
#   - if the word length is >= 5, reverse! the word
#   - map uses the word in its transformation
# - return the result joined into a new string