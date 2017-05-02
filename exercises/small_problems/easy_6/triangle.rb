# Easy 6: Exercise 10: Right Triangles (18 April 2017)

# Write a method that takes a positive integer, n, as an argument, and
# displays a right triangle whose sides each have n stars. The hypotenuse
# of the triangle (the diagonal side in the images below) should have one
# end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(n)
  (1..n).each { |num| puts ('*'*num).rjust(n) }
end

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****

def draw_stars(num, side, width)
  stars = '*' * num
  
  if side == :right
    puts stars.rjust(width)
  elsif side == :left
    puts stars.ljust(width)
  end
end

def triangle(n, side = :right, direction = :top)
  range = (1..n).to_a
  range.reverse! if direction == :bottom
  
  range.each { |num| draw_stars(num, side, n) }
end

triangle(5)
triangle(5, :left, :bottom)
triangle(5, :left, :top)
triangle(5, :right, :bottom)

#     *
#    **
#   ***
#  ****
# *****
# *****
# **** 
# ***  
# **   
# *    
# *    
# **   
# ***  
# **** 
# *****
# *****
#  ****
#   ***
#    **
#     *
