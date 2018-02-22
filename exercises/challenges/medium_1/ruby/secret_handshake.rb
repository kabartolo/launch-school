# Challenges: Medium 1
# 22 August, 2017
# Exercise 1: Secret Handshake

class SecretHandshake
	
	def initialize(number)
		@binary_digits = binary_digits(number).reverse
		@commands = ['wink', 'double blink', 'close your eyes','jump']
		reversal_digit = @binary_digits.pop
		reverse_if_required!(reversal_digit)
	end

	def commands
		@commands.select.with_index { |_, index| @binary_digits[index] == '1' }
	end

	private

	def binary_digits(number)
		digits = parse(number).chars

		until digits.size == 5
			digits.unshift('0')
		end

		digits
	end

	def binary?(number)
		number.to_s.match(/^[01]+$/)
	end

	def parse(input)
		binary?(input.to_s) ? input.to_s : input.to_i.to_s(2)
	end

	def reverse_if_required!(reversal_digit)
		if reversal_digit == '1'
			@binary_digits.reverse!
			@commands.reverse!
		end
	end
end