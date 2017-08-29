# Exercises: 130: Easy 1
# 10 July 2017
# Exercise 5

# Encrypted Pioneers

# The following list contains the names of individuals who are
# pioneers in the field of computing or that have had a significant
# influence on the field. The names are in an encrypted form, though,
# using a simple (and incredibly weak) form of encryption called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

# Write a program that deciphers and prints each of these names.
ENCRYPTED_NAMES = [
	'Nqn Ybirynpr',
	'Tenpr Ubccre',
	'Nqryr Tbyqfgvar',
	'Nyna Ghevat',
	'Puneyrf Onoontr',
	'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
	'Wbua Ngnanfbss',
	'Ybvf Unvog',
	'Pynhqr Funaaba',
	'Fgrir Wbof',
	'Ovyy Tngrf',
	'Gvz Orearef-Yrr',
	'Fgrir Jbmavnx',
	'Xbaenq Mhfr',
	'Fve Nagbal Ubner',
	'Zneiva Zvafxl',
	'Lhxvuveb Zngfhzbgb',
	'Unllvz Fybavzfxv',
	'Tregehqr Oynapu'
].freeze

def decipher_char(char)
	return char unless char =~ /[A-Za-z]/
	if char.ord > 78 && char.ord < 110
		(char.ord + 13).chr
	else
		(char.ord - 13).chr
	end
end

def decrypt_pioneers
	ENCRYPTED_NAMES.each do |name|
		decrypted_name = name.downcase.chars.map do |char|
												decipher_char(char)
											end

		puts decrypted_name.join.split(' ').map(&:capitalize).join(' ')
	end
end

decrypt_pioneers

# Different solution

# def cipher(distance)
# 	letters = ('a'..'z').to_a
# 	split_point = 26 - distance
# 	cipher = letters[split_point..-1] + letters[0..split_point - 1]

# 	letters += letters.map(&:upcase)
# 	return letters if distance <= 0 || distance >= 26
# 	cipher += cipher.map(&:upcase)

# 	letters.zip(cipher).to_h
# end

# def decrypt_pioneers(distance)
# 	cipher = cipher(distance)
# 	ENCRYPTED_NAMES.each do |name|
# 		puts name.chars.map { |char| cipher.fetch(char, char) }.join
# 	end
# end

# # Official solution
# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end

# ENCRYPTED_PIONEERS.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end

