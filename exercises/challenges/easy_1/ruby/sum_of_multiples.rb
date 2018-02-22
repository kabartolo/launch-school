# Challenges: Easy 1
# 21 August, 2017
# Exercise 5: Sum of Multiples

class SumOfMultiples
	def initialize(*numbers)
		@numbers = numbers
	end

	def self.to(limit)
		new(3, 5).to(limit)
	end

	def to(limit)
		return 0 if limit <= @numbers.min

		multiples = []
		@numbers.each do |given_num|
			multiples.concat (given_num...limit).step(given_num).to_a
		end

		multiples.uniq.reduce(:+)
	end
end
