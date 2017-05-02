# Easy 9: Exercise 4: Counting Up (20 April 2017)

# Write a method that takes an integer argument, and
# returns an Array of all integers, in sequence, between
# 1 and the argument.

# You may assume that the argument will always be a valid
# integer that is greater than 0.

def sequence(number)
  number < 0 ? (number..1).to_a.reverse : (1..number).to_a
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(-1) == [1, 0, -1]