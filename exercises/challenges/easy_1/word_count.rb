# Challenges: Easy 1
# 21 August, 2017
# Exercise 8: Word Count

class Phrase
	def initialize(phrase)
		@phrase = phrase
		@words = phrase.downcase.scan(/\b[\w']+\b/)
	end

	def word_count
		@words.each_with_object({Hash.new(0)}) do |word, result|
			result[word] += 1
		end
	end
end
