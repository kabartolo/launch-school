# Easy 8: Exercise 6: fizzbuzz (20 April 2017)

# Write a method that takes two arguments: the first
# is the starting number, and the second is the ending number.
# Print out all numbers between the two numbers, except if a number
# is divisible by 3, print "Fizz", if a number is divisible by 5,
# print "Buzz", and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".

def fizzbuzz(start, finish)
  (start..finish).map do |num| 
    result = ''
    result += 'Fizz' if num % 3 == 0 
    result += 'Buzz' if num % 5 == 0
    result = num.to_s if result.empty?
    result
  end.join(', ')
end

puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Prettier

def fizzbuzz(start, finish)
  start.upto(finish).with_object('').map do |num, result| 
    result += 'Fizz' if num % 3 == 0 
    result += 'Buzz' if num % 5 == 0
    result.empty? ? num : result
  end.join(', ')
end