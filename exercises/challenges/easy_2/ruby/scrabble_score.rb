# Challenges: Easy 2
# 22 August, 2017
# Exercise 2: Scrabble Score

class Scrabble

	SCORE_TABLE = { %w(A E I O U L N R S T) => 1,
									%w(D G) => 2,
									%w(B C M P) => 3,
									%w(F H V W Y) => 4,
									%w(K)=> 5,
									%w(J X) => 8,
									%w(Q Z) => 10 }.freeze

	def initialize(word)
		@word = word
	end

	def self.score(word)
		new(word).score
	end

	def score
		return 0 if @word.nil? || @word.match(/[^A-Za-z]/)
		
		letters = @word.upcase.chars

		letters.reduce(0) do |score, letter|
			points_key = SCORE_TABLE.keys.find { |list| list.include?(letter) }
			score += SCORE_TABLE[points_key]
		end
	end
end