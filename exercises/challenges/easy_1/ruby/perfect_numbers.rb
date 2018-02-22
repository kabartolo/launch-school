# Challenges: Easy 1
# 21 August, 2017
# Exercise 9: Perfect Number

class PerfectNumber
	def self.classify(number)
		raise RuntimeError, 'Number must be greater than 1' unless number > 1

		case factors(number).reduce(:+) <=> number
		when 1 then 'abundant'
		when -1 then 'deficient'
		when 0 then  'perfect'
		end
	end

	private

	def self.factors(number)
		(1..number / 2).select { |num| number % num == 0 }
	end
end

