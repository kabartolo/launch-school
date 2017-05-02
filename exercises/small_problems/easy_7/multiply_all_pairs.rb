# Easy 7: Exercise 9: Multiply All Pairs (20 April 2017)

# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of
# every pair of numbers that can be formed between the elements of the two
# Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(array1, array2)
  array1.product(array2).map { |pair| pair.reduce(:*) }.sort
end

def multiply_all_pairs(array1, array2)
  array1.map { |x| array2.map { |y| x*y } }.flatten.sort # or use flat_map
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]