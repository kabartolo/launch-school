# Easy 7: Exercise 4: Swap Case (20 April 2017)

# Write a method that takes a string as an argument and
# returns a new string in which every uppercase letter is
# replaced by its lowercase version, and every lowercase
# letter by its uppercase version. All other characters
# should be unchanged.

# You may not use String#swapcase; write your own version
# of this method.

def swapcase(string)
  string.chars.map { |c| c == c.upcase ? c.downcase : c.upcase }.join
end

def swapcase(string)
  string.tr('A-Za-z', 'a-zA-Z')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
p swapcase('123abc') == '123ABC'