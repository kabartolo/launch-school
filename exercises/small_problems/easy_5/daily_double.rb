# Easy 5: Exercise 9: ddaaiillyy ddoouubbllee (10 April 2017)

# Write a method that takes a string argument and returns
# a new string that contains the value of the original
# string with all consecutive duplicate characters collapsed
# into a single character.

def crunch(string)
  counter = 0
  single_chars = []

  while counter < string.size
    char = string[counter]
    single_chars << char unless char == single_chars.last

    counter += 1
  end

  single_chars.join('')
end

def crunch(string)
  string.squeeze
end

def crunch(string)
  string.chars.select.with_index(1) { |char, i| char != string[i] }.join
end

def crunch(string)
  single_chars = string.chars.each_with_object([]) do |c, array|
    array << c unless c == array.last
  end

  single_chars.join('')
end

def crunch(string)
  string.chars.chunk{ |c| c }.map{ |item| item[0] }.join
end

# Equivalent ^
def crunch(string)
  string.chars.chunk(&:itself).map(&:first).join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Using Regexp

def crunch(string)
  # () captures a character, \2 signifies 2 of the same char, 
  # {1,} means the double characters repeat at least once
  string.gsub(/((.))\2{1,}/, '\1')
end

def crunch(string)
  string.gsub(/(.)(?=\1)/, '')
end

def crunch(string)
  string.scan(/(.)(?!\1+)/).join
end

def crunch(string)
  string.tr_s(' -z', ' -z')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
