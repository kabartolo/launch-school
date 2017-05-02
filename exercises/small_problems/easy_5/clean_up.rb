# Easy 5: Exercise 5: Clean up the Words (10 April 2017)

# Given a string that consists of some words and an assortment of non-alphabetic
# characters, write a method that returns that string with all of the non-alphabetic
# characters replaced by spaces. If one or more non-alphabetic characters occur in a
# row, you should only have one space in the result (the result should never have
# consecutive spaces).

def cleanup(string)
  string.gsub(/[^a-zA-Z]+/, ' ')
end
# can also use squeeze(' ') without the + in the regular expression

puts cleanup("---what's my +*& line?") == ' what s my line '

# Without regular expressions

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def cleanup(string)
  string.chars.map { |c| ALPHABET.include?(c) ? c : ' ' }.join.squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '
