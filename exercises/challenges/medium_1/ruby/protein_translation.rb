# Challenges: Medium 1
# 23 August, 2017
# Exercise 4: Protein Translation
require 'pry'

class Translation

	CODON_TABLE =	{ ['AUG'] =>	'Methionine',
									['UUU', 'UUC']  =>	'Phenylalanine',
									['UUA', 'UUG' ]	 =>	'Leucine',
									['UCU', 'UCC', 'UCA', 'UCG']  =>	'Serine',
									['UAU', 'UAC']  =>	'Tyrosine',
									['UGU', 'UGC']  =>	'Cysteine',
									['UGG' ] => 'Tryptophan',
									['UAA', 'UAG', 'UGA']  =>	'STOP' }.freeze
	
	def self.of_codon(codon)
		CODON_TABLE.each do |codon_list, protein|
			return protein if codon_list.include?(codon)
		end

		raise InvalidCodonError
	end

	def self.of_rna(strand)
	  codons =  strand.scan(/.{3}/)

	  codons.each_with_object([]) do |codon, result|
			break result if of_codon(codon) == 'STOP'
			result << of_codon(codon)
		end
	end
end

class InvalidCodonError < StandardError; end
