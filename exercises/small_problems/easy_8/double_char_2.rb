# Easy 8: Exercise 8: Double Char (Part 2) (20 April 2017)

# Write a method that takes a string, and returns a new string
# in which every consonant character is doubled. Vowels (a,e,i,o,u),
# digits, punctuation, and whitespace should not be doubled.

CONSONANTS = ('a'..'z').to_a - 'aeiou'.chars

def double_consonants(string)
  string.chars.map { |c| CONSONANTS.include?(c.downcase) ? c * 2 : c }.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""