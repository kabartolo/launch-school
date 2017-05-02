# Easy 6: Exercise 2: Delete vowels (18 April 2017)

# Write a method that takes an array of strings, and returns an array of
# the same string values, except with the vowels (a, e, i, o, u) removed.

VOWELS = 'aeiouAEIOU'

def remove_vowels(string_array)
  string_array.map { |string| string.gsub(/[#{VOWELS}]/, '') }
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
