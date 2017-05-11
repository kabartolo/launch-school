# Medium 2: Exercise 10: Square Sum  (9 May 2017)

# Write a method that computes the difference between the
# square of the sum of the first n positive integers and the
# sum of the squares of the first n positive integers.

def sum_square_difference(n)
  first_positive_integers = (1..n).to_a
  square = Proc.new { |num| num**2 } # => or use abs2

  first_positive_integers.reduce(:+)**2 - first_positive_integers.map(&square).reduce(:+)
end

def sum_square_difference(n)
  first_positive_integers = (1..n).to_a
  
  first_positive_integers.reduce(:+)**2 - first_positive_integers.map(&:abs2).reduce(:+)
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150