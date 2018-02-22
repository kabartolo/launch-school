# Challenges: Easy 1
# 22 August, 2017
# Exercise 1: Odd Words

class OddWords
	def initialize(input)
		@input = input
	end

	def transform
		words = remove_extra_spaces_and_point(input).split(' ')
		output = ''
		
		words.map.with_index { |word, index| index.odd? ? word.reverse : word }
				 .join(' ') + '.'
	end

	# Bonus (needs refactoring)
	def transform_one_by_one
		skip_space = true
		words_seen = 0
		characters = @input.chars
		reverse_word = []

		characters.each_with_index do |char, index|
			if char == ' ' 
				if !end_of_input?(index) && !skip_space
					unless reverse_word.empty?
						reverse_word.each { |char| puts char }
						reverse_word = []
					end
					skip_space = true
					words_seen += 1
				else
					next
				end
			elsif char == '.'
				unless reverse_word.empty?
					reverse_word.each { |char| puts char }
					reverse_word = []
				end
			else
				reverse_word.unshift(char) if words_seen.odd?
				skip_space = false
			end

			puts char if reverse_word.empty?
		end
	end

	private

	def end_of_input?(index)
		@input[index..-1].match(/^\s*\.$/)
	end

	def remove_extra_spaces_and_point(text)
		text.gsub(/\s*\./, '').split(' ').join(' ')
	end
end

# Test cases assume no spaces will appear after the point and no
# invalid input will be given

OddWords.new('lots  of    spaces   .').transform_one_by_one
# OddWords.new('word.').transform_one_by_one
# OddWords.new('word .').transform_one_by_one
OddWords.new('two words.').transform_one_by_one
# OddWords.new('two  words .').transform_one_by_one
# OddWords.new('three words now.').transform_one_by_one
# OddWords.new('three words  now  .').transform_one_by_one
OddWords.new('whats the matter with kansas.').transform_one_by_one