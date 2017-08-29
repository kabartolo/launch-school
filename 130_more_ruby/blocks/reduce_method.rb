def reduce(array, start_value = 0)
	index = 0
	result = start_value

	while index < array.size
		result = yield(result, array[index])
		index += 1
	end

	result
end

array = [1, 2, 3, 4, 5]

puts reduce(array) { |acc, num| acc + num } # => 15
puts reduce(array, 10) { |acc, num| acc + num } # => 25
puts reduce(array) { |acc, num| acc + num if num.odd? } # => NoMethodError: undefined method `+' for nil:NilClass
