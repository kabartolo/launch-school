# Medium 2: Exercise 5: Triangle Sides? (5 May 2017)

# A triangle is classified as follows:

#     equilateral All 3 sides are of equal length
#     isosceles 2 sides are of equal length, while the 3rd is different
#     scalene All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the two shortest sides
# must be greater than the length of the longest side, and all sides must have
# lengths greater than 0: if either of these conditions is not satisfied, the
# triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
# on whether the triangle is equilateral, isosceles, scalene, or invalid.

def triangle_valid?(a, b, c)
  sides = [a, b, c]
  
  sides.all? { |num| num > 0 }
  sides.min(2).reduce(:+) > sides.max
end

def triangle(a, b, c)
  return :invalid if not triangle_valid?(a, b, c)

  case [a, b, c].uniq.size
  when 3 then :scalene
  when 2 then :isosceles
  when 1 then :equilateral
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid