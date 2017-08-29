# Exercises: 130: Easy 2
# 8 August 2017
# Exercise 2

# Zipper

# The Array#zip method takes two arrays, and combines
# them into a single array in which each element is a
# two-element array where the first element is a value
# from one array, and the second element is a value from
# the second array, in order. For example:

# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Write your own version of zip that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

def zip(array1, array2)
	result = []
	array1.size.times do |index|
		result << [array1[index], array2[index]]		
	end

	result
end

def zip(array1, array2)
	result = []
	array1.each_with_index do |item1, index|
		item2 = array2[index]
		result << [item1, item2]
	end

	result
end

def zip(array1, array2)
	array1.each_with_index.with_object([]) do |(item, index), result|
		result << [item, array2[index]]
	end
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
