# Exercises: 130: Easy 1
# 10 July 2017
# Exercise 4

# Divisors

# Write a method that returns a list of all of the divisors of the
# positive integer passed in as an argument. The return value can be in
# any sequence you wish.

# Brute force
def divisors(pos_integer)
	(1..pos_integer).select { |num| pos_integer % num == 0 }
end

# Optimized
def divisors(pos_integer)
	return [pos_integer] if pos_integer == 1

	result = []
	1.upto(pos_integer / 2).each do |num|
		break if result.include?(num)
		divisor, remainder = pos_integer.divmod(num)
		if remainder == 0
			result << num
			result << divisor
		end
	end

	result.sort
end

p divisors(1) == [1]
p divisors(2) == [1, 2]
p divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
