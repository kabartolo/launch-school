# Easy 2: Exercise 6: Odd Numbers (31 March 2017)

# Print all odd numbers from 1 to 99, inclusive. All numbers
# should be printed on separate lines.

(1..99).each { |num| puts num if num.odd? }

# # LS solution 

value = 1
while value <= 99
  puts value
  value += 2
end

# Repeat this exercise with a technique different from the one
# you just used, and different from the solution shown above. You
# may want to explore the use Integer#upto or Array#select methods,
# or maybe use Integer#odd?

(1..99).select(&:odd?).each { |num| puts num } # => array of odd numbers

1.upto(99) { |num| puts num if num.odd? } # => 1

(1..99).step(2) { |num| puts num } # => 1..99

1.step(by: 2, to: 99) { |num| puts num} # => 1

puts 1.step(by: 2, to: 99).to_a # => nil