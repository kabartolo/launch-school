# Advanced 9: Egyptian Fractions (9 May 2017)

# A Rational Number is any number that can be represented as the result of the
# division between two integers, e.g., 1/3, 3/2, 22/7, etc. The number to the left
# is called the numerator, and the number to the right is called the denominator.

# A Unit Fraction is a rational number where the numerator is 1.

# An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are
#   the same), such as:

# 1   1    1    1
# - + - + -- + --
# 2   3   13   15

# Every positive rational number can be written as an Egyptian fraction. For example:

#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6

# Write two methods: one that takes a Rational number as an argument, and returns an
# Array of the denominators that are part of an Egyptian Fraction representation of
# the number, and another that takes an Array of numbers in the same format, and
# calculates the resulting Rational number. You will need to use the Rational
# class provided by Ruby.

def egyptian(rational)
  result = []
  sum = Rational(0)
  denominator = 1
  
  loop do
    current_rational = Rational(1/denominator)
    sum += current_rational
    if sum <= rational
      result << denominator.to_i
    else
      sum -= current_rational
    end
    break if sum == rational.to_f
    denominator += 1.0
  end

  result
end

def unegyptian(array)
  sum = Rational(0)
  array.each { |denominator| sum += Rational(1, denominator) }

  sum
end

# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
p egyptian(Rational(39, 20))

# puts unegyptian(egyptian(Rational(1, 2))) #== Rational(1, 2)
# puts unegyptian(egyptian(Rational(3, 4))) #== Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) #== Rational(39, 20)
# puts unegyptian(egyptian(Rational(127, 130))) #== Rational(127, 130)
# puts unegyptian(egyptian(Rational(5, 7))) #== Rational(5, 7)
# puts unegyptian(egyptian(Rational(1, 1))) #== Rational(1, 1)
# p unegyptian(egyptian(Rational(2, 1))) #== Rational(2, 1)
# puts unegyptian(egyptian(Rational(3, 1))) #== Rational(3, 1)

# #egyptian
# input: instance of the Rational class, e.g., Rational(1, 2) => (1/2)
# output: array of denominators

# rules: 
#        take a rational number as argument
#        return the denominators of a series of distinct unit fractions that
#        sum to the given rational number.

# START given a rational number called 'rational'
# SET result = []
# SET sum = 0
# SET denominator = 1.0 (float)
# LOOP
#  add Rational(1.0/denominator) to sum
#  if sum <= rational (float), add denominator to result
#  elsif sum > rational, subtract Rational(1/denominator)
  
#  if sum is equal to rational, break
#  denominator +=1 

# return result


# 
# #unegyptian
# Set sum = 0
# Convert each item in the array to a float
# iterate through the array
#   Set current item to 'denominator'
#   Add Rational(1.0/'denominator') to sum
# Set result = convert the sum (a float) to a rational (to_r)
# RETURN the result