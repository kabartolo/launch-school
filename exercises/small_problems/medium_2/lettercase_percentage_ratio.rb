# Medium 2: Exercise 3: Lettercase Percentage Ratio (4 May 2017)

# In the easy exercises, we worked on a problem where we
# had to count the number of uppercase and lowercase characters,
# as well as characters that were neither of those two. Now we
# want to go one step further.

# Write a method that takes a string, and then returns a hash
# that contains 3 entries: one represents the percentage of
# characters in the string that are lowercase letters, one
# the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def percent(a, b)
  (a / b.to_f) * 100
end

def letter_percentages(string)
  num_chars = string.length
  lc = percent(string.count('a-z'), num_chars)
  uc = percent(string.count('A-Z'), num_chars)
  neither = percent(string.count('^a-zA-Z'), num_chars)

  { lowercase: lc, uppercase: uc, neither: neither }
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }