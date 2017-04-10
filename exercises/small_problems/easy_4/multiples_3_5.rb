# Easy 4: Exercise 5: Multiples of 3 and 5 (6 April 2017)

# Write a method that searches for all multiples of 3 or 5
# that lie between 1 and some other number, and then computes
# the sum of those multiples. For instance, if the supplied
# number is 20, the result should be 
# 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(num)
  multiples = 1.upto(num).select do |x| # #upto => an Enumerable if no block given
    multiple?(x, 5) || multiple?(x, 3)
  end
  
  multiples.inject(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
