# Exercises: 120 Object-Oriented Programming: Medium 1
# 16 June 2017
# Exercise 2

# Fixed Array

# A fixed-length array is an array that always has a fixed number
# of elements. Write a class that implements a fixed-length array,
# and provides the necessary methods to support the following code:

class FixedArray
	def initialize(length)
		@array = Array.new(5)
	end

	def [](index)
		# raise IndexError if index >= @array.size
		# @array[index]
		@array.fetch(index) # => built-in IndexError for index out of range
	end

	def []=(index, item)
		@array.fetch(index)
		@array[index] = item
	end

	def to_a
		# @array
		@array.clone # => safer
	end

	def to_s
		# "#{@array}"
		to_a.to_s
	end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

# The above code should output true 15 times.