# Easy 3: Exercise 5: Squaring an Argument (31 March 2017)

# Using the multiply method from the "Multiplying Two Numbers"
# problem, write a method that computes the square of its
# argument (the square is the result of multiplying a number
# by itself).

# Example:

# square(5) == 25
# square(-8) == 64

def multiply(a, b)
  a * b
end

def square(num)
  multiply(num, num)
end

puts square(5)

def power(num, exponent)
  return 1 if exponent == 0
  return num if exponent == 1

  result = 1
  exponent.times { result = multiply(result, num) }
  result
end

puts power(5, 2)
puts power(3, 3)
puts power(2, 10)