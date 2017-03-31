# Easy 2: Exercise 7: Even Numbers (31 March 2017)

# Print the even numbers from 1 to 99, inclusive.
# All numbers should be printed on separate lines.

(1..99).select(&:even?).each { |num| puts num }