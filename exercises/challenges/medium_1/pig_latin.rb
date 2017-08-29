# Challenges: Medium 1
# 23 August, 2017
# Exercise 3: Pig Latin

class PigLatin
	def self.translate(phrase)
		phrase.split(' ')
		      .map { |word| shift_consonants(word) + 'ay' }
		      .join(' ')
	end

	private

	def self.shift_consonants(word)
		cons = word.match(/^([^aeiou]*qu|[^aeiou]+)/).to_s
		cons.gsub!(/^[xy][^aeiou]+/, '')

		word.partition(cons).reverse.join
	end
end
