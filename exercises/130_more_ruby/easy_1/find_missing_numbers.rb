# Exercises: 130: Easy 1
# 10 July 2017
# Exercise 3

# Find Missing Numbers

# Write a method that takes a sorted array of
# integers as an argument, and returns an
# array that includes all of the missing
# integers (in order) between the first
# and last elements of the argument.

def missing(sorted_array)
	result = []
	(sorted_array.first..sorted_array.last).each do |num|
		result << num unless sorted_array.include?(num)
	end

	result
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []

# Official solution
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# Solution without a method that a requires a block

def missing(array)
	(array.first..array.last).to_a - array
end
