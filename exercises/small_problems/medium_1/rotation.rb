# Medium 1: Exercise 1: Rotation (Part 1) (21 April 2017)

# Write a method that rotates an array by moving the first
# element to the end of the array. The original array should not be modified.

# Do not use the method Array#rorate or Array#rotate! for your
# implementation

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_array(array)
  first, *remainder = array
  [*remainder, first]
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p rotate_string('eat') == 'ate'
p rotate_integer(123) == 231