# Easy 3: Exercise 3: Counting the Number of Characters (31 March 2017)

# Write a program that will ask a user for an input of a word or multiple
# words and give back the number of characters. Spaces should not be counted
# as a character.

# input:

# Please write word or multiple words: walk

# output:

# There are 4 characters in "walk".

# input:

# Please write word or multiple words: walk, don't run

# output:

# There are 13 characters in "walk, don't run".

def count_characters(words)
  words.delete(' ').size
  # or words.split.join.size
end

puts "Enter one or more words"
words = gets.chomp
p count_characters(words)

# Interesting
words.count('^ ')
