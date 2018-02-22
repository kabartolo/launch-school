# Challenges: Easy 1
# 21 August, 2017
# Exercise 10: Roman Numerals

# First solution
class Integer
	CONVERSION_MAP = { 1000 => 'M',
										 900 => 'CM',
										 500 => 'D',
										 400 => 'CD',
										 100 => 'C',
										 90 => 'XC',
										 50 => 'L',
										 40 => 'XL',
										 10 => 'X',
										 9 => 'IX',
										 5 => 'V',
										 4 => 'IV',
										 1 => 'I' }
	
	def to_roman
		result = ''
		integer = self

		CONVERSION_MAP.each do |arabic_num, roman_num|
			digit = integer / arabic_num
			result += roman_num * digit
			integer -= digit * arabic_num
		end

		result
	end
end

# A second solution without mapping the 4s and 9s
# class Integer
# 	CONVERSION_MAP = { 1000 => 'M',
# 										 500 => 'D',
# 										 100 => 'C',
# 										 50 => 'L',
# 										 10 => 'X',
# 										 5 => 'V', 
# 										 1 => 'I' }
	
# 	def to_roman
# 		result = ''
# 		digits = self.to_s.chars.map(&:to_i)
# 		powers_of_ten = digits.map.with_index { |_, index| index }.reverse
		
# 		digits.each_with_index do |digit, index|
# 			next if digit == 0
# 			exp = powers_of_ten[index]

# 			if digit == 9
# 				result += CONVERSION_MAP[10**exp] + CONVERSION_MAP[10 * 10**exp]
# 			elsif digit == 4
# 				result += CONVERSION_MAP[10**exp] + CONVERSION_MAP[5 * 10**exp]
# 			else
# 				fives, ones = digit.divmod(5)
# 				unless exp == 3
# 					result += CONVERSION_MAP[5 * 10**exp] * fives
# 				end
# 				result += CONVERSION_MAP[10**exp] * ones
# 			end
# 		end

# 		result
# 	end
# end


