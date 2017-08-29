# Exercises: 130: Easy 1
# 10 July 2017
# Exercise 10

# Count Items

# Write a method that takes an array as an argument,
# and a block that returns true or false depending on the
# value of the array element passed to it. The method should
# return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

def count(collection)
	count = 0
	collection.each do |item|
		count += 1 if yield(item)
	end

	count
end

count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2
