# Medium 1: Exercise 3: Rotation (Part 3) (21 April 2017)

# If you take a number like 735291 and rotate it to the left,
# you get 352917. If you now keep the first digit fixed
# in place, and rotate the remaining digits, you get
# 329175. Keep the first 2 digits fixed in place and rotate
# again to 321759. Keep the first 3 digits fixed in place and 
# again to get 321597. Finally keep the first 4 digits fixed
# and rotate the final 2 digits to get 321579. The resulting
# number is called the maximum rotation of the original
# number.

# Write a method that takes an argument and returns the
# maximum rotation of the argument. You can (and probably
# should) use the rotate_rightmost_digits method
# from the previous exercise.

# 735291 => 352917 (rightmost_digits(number, 6))
# (3)52917 => (3)29175
# (32)9175 => (32)1759
# (321)759 => (321)597
# (3215)97 => (3215)79 max rotation
# (32157)9 => 321579 max rotation
require 'pry'
def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_rightmost_digits(number, n)
  leftmost_digits = number.to_s[0...-n]
  rightmost_digits = number.to_s[-n..-1]

  (leftmost_digits + rotate_string(rightmost_digits)).to_i
end

def rotate_rightmost_chars(number_string, n)
  leftmost_chars = number_string[0...-n]
  rightmost_chars = number_string[-n..-1]

  leftmost_chars + rotate_string(rightmost_chars)
end

def max_rotation(number)
  size = number.to_s.size
  result = ''
  digits_to_rotate = number.to_s

  size.downto(1) do |n|
    rotation = rotate_rightmost_chars(digits_to_rotate, n)
    digits_to_rotate = rotation[1..-1]

    result += rotation[0]
  end
  
  result.to_i
end

def max_rotation(number)
  size = number.to_s.size

  size.downto(1) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(50) == 5
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
