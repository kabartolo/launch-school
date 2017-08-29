# Challenges: Medium 1
# 23 August, 2017
# Exercise 2: Luhn Algorithm

class Luhn
	attr_reader :number

	def initialize(number)
		@number = number
		@digits = parse(number)
	end

	def self.create(number)
		return number if new(number).valid?

		candidate = new(number * 10)
		if candidate.valid? 
			candidate.number
		else
			check_digit = 10 - (candidate.checksum % 10)
			(number * 10) + check_digit
		end
	end

	def addends
		@digits.map.with_index do |digit, index|
			(@digits.size - index).even? ? double(digit) : digit
		end
	end

	def checksum
		addends.reduce(:+)
	end

	def valid?
		checksum % 10 == 0
	end

	private

	def double(digit)
		doubled = digit * 2

		doubled >= 10 ? doubled - 9 : doubled
	end

	def parse(number)
		number.to_s.chars.map(&:to_i)
	end
end