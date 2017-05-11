# Medium 2: Exercise 2: ABCs (4 May 2017)

# A collection of spelling blocks has two letters per block,
# as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks
# to just those words that do not use both letters from
# any given block. Each block can only be used once.

# Write a method that returns true if the word passed
# in as an argument can be spelled from this set of blocks,
# false otherwise.

def block(letter)
   letter + (letter.ord + (letter < 'M' ? 13 : -13)).chr
end

def block_word?(string)
  string.chars.none? { |char| string.count(block(char)) > 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true


# Launch School solution

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end