# Easy 8: Exercise 7: Double Char (Part 1) (20 April 2017)

# Write a method that takes a string, and returns a new string
# in which every character is doubled.

def repeater(string)
  string.gsub(/(.)/, '\1\1')
end

def repeater(string)
  str.gsub(/./, '\0\0')
end

def repeater(string)
  string.chars.map { |c| c * 2 }.join
end

def repeater(string)
  string.chars.map { |c| c << c }.join
end

def repeater(string)
  string.chars.zip(string.chars).join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''