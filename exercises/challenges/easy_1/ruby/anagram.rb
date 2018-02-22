# Challenges: Easy 1
# 21 August, 2017
# Exercise 6: Anagrams

# class Anagram
# 	def initialize(word)
# 		@word = word.downcase
# 		@letters = @word.chars.sort
# 	end

# 	def match(words)
# 		words.select { |word| anagram?(word) }
# 	end

# 	def anagram?(possible_anagram)
# 		possible_anagram.downcase != @word &&
# 		possible_anagram.chars.sort == @letters
# 	end
# end

# Without the #sort method
class Anagram
	def initialize(word)
		@word = word.downcase
	end

	def match(words)
		words.select { |word| anagram?(word.downcase) }
	end

	private

	def anagram?(possible_anagram)
		@word != possible_anagram &&
		letter_counts(@word) == letter_counts(possible_anagram)
	end

	def letter_counts(word)
		count = word.chars.uniq.map do |char|
			[char, word.count(char)]
		end

		count.to_h
	end
end
