# Easy 7: Exercise 3: Word Cap (18 April 2017)

# Write a method that takes a single String argument and returns
# a new string that contains the original value of the argument,
# but the first letter of every word is now capitalized.

# You may assume that words are any sequence of non-blank characters,
# and that only the first character of each word must be considered.

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

# Without the capitalize method

def word_cap(string)
  string.split.map { |word| word[0] = word[0].upcase; word }.join(' ')
end

puts word_cap('four score and seven') #== 'Four Score And Seven'
puts word_cap('the javaScript language') #== 'The Javascript Language'
puts word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
