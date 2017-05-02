# Medium 1: Exercise 5: Diamonds (2 May 2017)

# Write a method that displays a 4-pointed diamond in
# an n x n grid, where n is an odd integer that is supplied as
# an argument to the method. You may assume that the argument will
# always be an odd integer.

def draw_stars(number_of_stars, line_width)
  puts ('*'*number_of_stars).center(line_width)
end

def diamond(n)
  line_widths = (1..n).to_a + (1..n-1).to_a.reverse

  (0...line_widths.length).step(2) do |index|
    draw_stars(line_widths[index], n)
  end
end

diamond(1)
diamond(3)
diamond(9)

# Prints only outline

def draw_stars(number_of_stars, line_width)
  stars = '*' + (number_of_stars == 1 ? '' : ' '*(number_of_stars - 2) + '*')
  puts stars.center(line_width)
end

def diamond(n)
  line_widths = (1..n).to_a + (1..n-1).to_a.reverse

  (0...line_widths.length).step(2) do |index|
    draw_stars(line_widths[index], n)
  end
end

diamond(1)
diamond(3)
diamond(9)