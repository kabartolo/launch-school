# Easy 7: Exercise 7: Multiplicative Average (20 April 2017)

# Write a method that takes an Array of integers as input, multiplies all
# of the numbers together, divides the result by the number of entries in
# the Array, and then prints the result rounded to 3 decimal places.

def show_multiplicative_average(num_array)
  result = num_array.reduce(:*).to_f / num_array.size
  puts "The result is #{format('%.3f', result)}"
end

# Using #fdiv
def show_multiplicative_average(num_array)
  puts format('The result is %.3f', num_array.reduce(:*).fdiv(num_array.size))
end

show_multiplicative_average([3, 5])
# => The result is 7.500

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# => The result is 28361.667