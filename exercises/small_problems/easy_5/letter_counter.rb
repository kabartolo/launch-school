# Easy 5: Exercise 6: Letter Counter (Part 1) (10 April 2017)

# Write a method that takes a string with one or more space separated words
 # and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(string)
  counts = {}
  string.split(' ').each do |word|
    counts.include?(word.size) ? counts[word.size] += 1 : counts[word.size] = 1
  end
  counts
end

# Use Hash.new(0) to force references to non-existing keys to return 0

def word_sizes(string)
  counts = Hash.new(0)
  string.split(' ').each do |word|
    counts[word.size] += 1
  end
  counts
end

# Using reduce (return hash at the end of the block)

def word_sizes(string)
  string.split.reduce(Hash.new(0)) do |hash, word| hash[word.size] += 1; hash }
end

# Using group_by and map 
def word_sizes(string)
  string.split.group_by(&:size).map { |size, count| [size, count.size] }.to_h
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

