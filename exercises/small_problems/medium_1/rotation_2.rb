# Medium 1: Exercise 2: Rotation (Part 2) (21 April 2017)

# Write a method that can rotate the last n digits of a number.
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

def rotate_rightmost_digits(number, n)
  left, right = number.divmod(10**n)
  
  (left.to_s + rotate_string(right.to_s)).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
