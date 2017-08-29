# Challenges: Easy 1
# 21 August, 2017
# Exercise 1: Series

class Series
	def initialize(string)
		@digits = string.chars.map(&:to_i)
	end

	def slices(n)
		raise(ArgumentError, 'Slice is greater than input size') if n > @digits.size
		@digits.each_cons(n).to_a
	end
