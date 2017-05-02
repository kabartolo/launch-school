# Easy 6: Exercise 7: Halvsies (18 April 2017)

# Write a method that takes an Array as an argument, and
# returns two Arrays that contain the first half and second
# half of the original Array, respectively. If the original
# array contains an odd number of elements, the middle element
# should be placed in the first half Array.

def halvsies(array)
  middle_index = (array.size.odd? ? array.size + 1 : array.size) / 2
  
  array.partition.with_index { |_, i| i < middle_index }
end

def halvsies(array)
  array.partition.with_index { |_, i| i < (array.size / 2.0).ceil }
end

def halvsies(array)
  array.partition.with_index { |_, i| i < array.size.fdiv(2).ceil }
end

p halvsies([1, 2, 3, 3, 2, 1]) == [[1, 2, 3], [3, 2, 1]]
p halvsies([2, 2, 2, 2]) == [[2, 2], [2, 2]]
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
