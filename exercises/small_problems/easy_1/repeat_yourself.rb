# Easy 1: 1. Repeat Yourself
# Write a method that takes two arguments, a string and a
# positive integer, and prints the string as many times as the
# integer indicates.

# Assumptions:
# Given an empty string, just print the empty string n times
# Return nil if string or num are nil
# Treat 0 and negative values of num as "print nothing"

def repeat(string, num)
  return if !string || !num

  num.times do
    puts string
  end
end

#--- Test Cases---#
puts "=>Print 'Hello' 3 times"
repeat('Hello', 3)
puts
puts "=>Print 'Hello' 0 times"
repeat('Hello', 0)
puts
puts "=>Print 'Hello' -1 times (should do nothing)"
repeat('Hello', -1)
puts
puts '=>Print empty string 2 times'
repeat('', 2)
puts
puts '=>nil string: Return without printing'
repeat(nil, 2)
puts
puts '=>nil num: Return without printing'
repeat('Hello', nil)
