# Easy 7: Exercise 8: Multiply Lists (20 April 2017)

# Write a method that takes two Array arguments in which each Array
# contains a list of numbers, and returns a new Array that contains the
# product of each pair of numbers from the arguments that have the same index.
# You may assume that the arguments contain the same number of elements.

def multiply_list(array1, array2)
  array1.zip(array2).map { |pair| pair.reduce(:*) }
end

def multiply_list(array1, array2)
  array1.zip(array2).map { |a, b| a * b }
end

def multiply_list(array1, array2)
  block = lambda { |a| a.reduce(:*) }
  array1.zip(array2).map(&block)
end

def multiply_list(array1, array2)
  [array1, array2].transpose.map { |a, b| a * b }
end

def multiply_list(*arrays)
  arrays.transpose.map { |pair| pair.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]