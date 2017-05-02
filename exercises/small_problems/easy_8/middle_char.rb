# Easy 8: Exercise 10: Get the Middle Character (20 April 2017)

# Write a method that takes a non-empty string argument, and
# returns the middle character or characters of the argument.
# If the argument has an odd length, you should return exactly
# one character. If the argument has an even length, you
# should return exactly two characters.

def center_of(string)
  center_index = string.length / 2
  if string.length.odd?
    string[center_index]
  else
    string[center_index - 1)..center_index]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'