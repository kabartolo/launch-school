# Easy 1: Exercise 5: Reverse It (Part 1) (March 20, 2017)

# Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

def reverse_sentence(sentence)
  return if sentence.nil?
  sentence.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('one') == 'one'
puts reverse_sentence(nil) == nil