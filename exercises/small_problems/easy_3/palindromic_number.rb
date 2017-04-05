# Easy 3: Exercise 10: Palindromic Numbers (5 April 2017)

# Write a method that returns true if its integer argument
# is palindromic, false otherwise. A palindromic number reads
# the same forwards and backwards.

def palindrome?(string)
  string.reverse == string
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Suppose your number begins with one or more 0s. Will your
# method still work? Why or why not? Is there any way to address
# this?

p palindromic_number?(03430) == true # => false

# => 03430.to_s = "1816"
# 03430 is the octal representation of the number 1816
# To convert it to a string: 
# '0%o' % 03430  # 0: leading zero, %o: represent as an octal
# => "03430"

# See http://stackoverflow.com/questions/28545559/how-to-work-with-leading-zeros-in-integers

# However, the above string conversion will not work with an octal passed to a method.
# Ruby converts it to an Integer instance (base 10) and the Integer class does not
# store leading zeros, since any leading zero is interpreted as a prefix. A number can
# be entered in any base (it is a number literal, not an Integer instance) but it will be
# converted to the Integer instance.

# The original number literal cannot be accessed. There is no way to check if an octal or
# a decimal was originally entered since they are the same number
# (03430.object_id == 1816.object_id # => true).
# The method above thus must be given a string representation - "03430"