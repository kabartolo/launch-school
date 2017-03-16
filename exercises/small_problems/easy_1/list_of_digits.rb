# Easy 1: Exercise 3: List of Digits (16 March 2017)

# Write a method that takes one argument, a positive integer, and
# returns a list of the digits in the number.

# Assumptions:
# - Return nil if num is nil
# - Convert to positive integer in case given negative integer, float or string
# number
# - A character string (e.g., 'string') as input will return [0] so
# return nil in this case instead.

def digit_list(num)
  # Return nil if num is nil or a string that cannot be converted to an integer
  return if !num || num.to_i.zero? && !num.zero?

  num = num.to_i.abs
  num.to_s.split('').map(&:to_i)
end

#---Test Cases---#
puts '=> digit_list(12345) == [1, 2, 3, 4, 5]'
puts digit_list(12345) == [1, 2, 3, 4, 5]
puts '=> digit_list(7) == [7]'
puts digit_list(7) == [7]
puts '=> digit_list(375290) == [3, 7, 5, 2, 9, 0]'
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts '=> digit_list(444) == [4, 4, 4]'
puts digit_list(444) == [4, 4, 4]
puts '=> digit_list(nil) == nil'
puts digit_list(nil).nil?
puts '=> digit_list(-1) == [1]'
puts digit_list(-1) == [1]
puts '=> digit_list(0) == [0]'
puts digit_list(0) == [0]
puts '=> digit_list(30.5) == [3, 0]'
puts digit_list(30.5) == [3, 0]
puts "=> digit_list('4') == [4]"
puts digit_list('4') == [4]
puts "=> digit_list('x') == nil"
puts digit_list('x').nil?
