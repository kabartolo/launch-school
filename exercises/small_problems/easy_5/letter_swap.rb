# Easy 5: Exercise 4: Letter Swap (10 April 2017)

# Given a string of words separated by spaces, write a method
# that takes this string of words and returns a string in which
# the first and last letters of every word is swapped.

# You may assume that every word contains at least one letter, and
# that the string will always contain at least one word. You may
# also assume that each string contains nothing but words and spaces.

def swap(string)
  string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

# Alternative: first, *mid, last = word.chars
#              "#{last}#{mid.join}#{first}"
# Interesting: p = proc { |word| word[0], word[-1] = word[-1], word[0] }
#              string.split.each(&p).join(' ')

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

# Further Exploration

# How come our solution does not use the return value of swap_first_last_characters? Suppose we had this method:

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# (disregard the lousy name) and called it like this:

# swap_first_last_characters(word[0], word[-1])

# Would this method work? Why or why not?

# SOLUTION: This does not work because t return statement a, b
# becomes an array [a, b] so this method would return [last, first]