# Easy 6: Exercise 9: Does My List Include This? (18 April 2017)

# Write a method named include? that takes an Array and a 
# search value as arguments. This method should return true
# if the search value is in the array, false if it is not.
# You may not use the Array#include? method in your solution.

def include?(array, value)
  array.select { |item| item == value }.count > 0
end

def include?(array, value)
  !!array.find_index(value) # or !!array.index(value)
end

def include?(array, value)
  array.any? { |item| item == value }
end

def include?(array, value)
  array.member?(value) # essentially the same as include
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false