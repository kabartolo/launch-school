# Easy 9: Exercise 6: How Long Are You? (20 April 2017)

# Write a method that takes a string as an argument, and
# returns an Array that contains every word from the string, to
# which you have appended a space and the word length.

# You may assume that words in the string are separated by
# exactly one space, and that any substring of non-space
# characters is a word.

def word_lengths(string)
  words = string.split(' ')
  words.map { |word| "#{word} #{word.length}" }
end

# ^ slightly more readable than
def word_lengths(string)
  string.split.map { |word| "#{word} #{word.length}" }
end

puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
puts word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
puts word_lengths("It ain't easy, is it?")
puts word_lengths("Supercalifragilisticexpialidocious")
puts word_lengths("") == []