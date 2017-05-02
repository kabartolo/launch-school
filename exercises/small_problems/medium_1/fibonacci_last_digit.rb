# Medium 1: Exercise 10: Fibonacci Numbers (Last Digit)  (2 May 2017)

# In the previous exercise, we developed a procedural method for computing
# the value of the nth Fibonacci numbers. This method was really fast,
# computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last digit
# of the nth Fibonacci number.

def fibonacci(n)
  first = second = 1
  
  3.upto(n) do
    first, second = second, (first + second)
  end

  second
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i # => slow
end

def fibonacci_last(n)
  first = second = 1
  
  3.upto(n) do
    first, second = second, (first + second) % 10 # => slightly faster
  end

  second
end


# Further exploration
# Fastest solution
# The last digit repeats in cycles of 60 

def fibonacci_last(n)
  first = second = 1
  n = n % 60 == 0 ? 60 : n % 60
  
  3.upto(n) do
    first, second = second, (first + second) % 10
  end

  second
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4
puts fibonacci_last(123456789987745) # => 5