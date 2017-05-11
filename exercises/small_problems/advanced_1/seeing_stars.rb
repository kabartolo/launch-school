# Advanced 2: Seeing Stars  (9 May 2017)

# Write a method that displays an 8-pointed star in an
# nxn grid, where n is an odd integer that is supplied as
# an argument to the method. The smallest such star you need 
# to handle is a 7x7 grid.

# Write a method that displays an 8-pointed star in an
# nxn grid, where n is an odd integer that is supplied as
# an argument to the method. The smallest such star you need 
# to handle is a 7x7 grid.

def make_rows(grid_size, top_height)
  stars = '*' * 3
  rows = []
  number_of_spaces = top_height - 1
  
  top_height.times do
     row = stars.chars.join(' ' * number_of_spaces).center(grid_size)
     rows << row
     number_of_spaces -= 1
  end

  rows += rows.reverse
  rows.insert(top_height, '*' * grid_size)

  rows
end

def star(size)
  top_height = (size-1) / 2
  rows = make_rows(size, top_height)
  
  rows.each { |row| puts row }
end

star(7)
star(9)

# input: integer size  representing the nxn grid
# output: display of an 8-pointed star

# Pseudocode:
# START given integer size representing a size_by_size grid
# SET top_height = (size-1) / 2
# SET line = '*' * 3
# SET rows = []
# backwards_counter = top_height

# LOOP top_height times with variable index:
#  stars = join the 3 stars with space times backwards_counter
#  add to rows: space times index plus stars plus space times index
#  (can just center it)
# add center row to rows
# add reversed rows array to rows
# print each row in rows array

# star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
