# Easy 5: Exercise 7: Letter Counter (Part 2) (10 April 2017)

# Modify the word_sizes method from the previous exercise to exclude non-letters when determining
# word size. For instance, the length of "it's" is 3, not 4.

def word_sizes(string)
  counts = Hash.new(0)
  string.split.map{ |word| counts[count_letters_only(word)] += 1 }

  counts
end

def count_letters_only(word)
  word.count('A-Z-a-z')
  # OR word.delete('^A-Za-z').size
  # OR word.gsub(/\W/, '').size
end


puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}