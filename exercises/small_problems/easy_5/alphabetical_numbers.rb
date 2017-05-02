# Easy 5: Exercise 8: Alphabetical Numbers (10 April 2017)

# Write a method that takes an Array of Integers between 0 and
# 19, and returns an Array of those Integers sorted based on
# the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine,
# ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen,
# seventeen, eighteen, nineteen

NUM_TO_WORD_TABLE = %w(zero one two three four five six seven
                                eight nine ten eleven twelve thirteen
                                fourteen fifteen sixteen seventeen eighteen
                                nineteen)

def alphabetic_number_sort(integer_array)
  integer_array.sort_by { |num| NUM_TO_WORD_TABLE[num] }
end 

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# using #sort

def alphabetic_number_sort(integer_array)
  integer_array.sort { |x, y| NUM_TO_WORD_TABLE[x] <=> NUM_TO_WORD_TABLE[y] }
end 

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]