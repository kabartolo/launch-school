# Challenges: Easy 1
# 21 August, 2017
# Exercise 7: Point Mutations

class DNA
	def initialize(strand)
		@strand = strand
	end

	def hamming_distance(other_strand)
		strand = @strand[0, other_strand.length]
		
		strand.chars.zip(other_strand.chars)
								.count { |pair| pair.first != pair.last }
	end
end
