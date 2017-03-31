# Easy 2: Exercise 2: How Big is the Room? (30 March 2017)

# Build a program that asks a user for the length and
# width of a room in meters and then displays the area
# of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQUARE_METERS_TO_SQUARE_FEET = 10.7639
  
def display_area
  puts "Enter a length of the room in meters:"
  length = gets.chomp.to_f

  puts "Enter a width of the room in meters:"
  width = gets.chomp.to_f

  square_meters = (length * width).round(2)
  square_feet = (square_meters * SQUARE_METERS_TO_SQUARE_FEET).round(2)

  puts "The area of the room is #{square_meters} " +
       "square meters (#{square_feet} square feet)."
end

display_area

# Modify this program to ask for the input measurements in
# feet, and display the results in square feet, square inches
# and square centimeters.

SQUARE_FEET_TO_SQUARE_INCHES = 144
SQUARE_FEET_TO_SQUARE_CM = 929.03

def display_area
  puts "Enter a length of the room in feet:"
  length = gets.chomp.to_f

  puts "Enter a width of the room in feet:"
  width = gets.chomp.to_f

  square_feet = (length * width).round(2)
  square_inches = (square_feet * SQUARE_FEET_TO_SQUARE_INCHES).round(2)
  square_cm = (square_feet * SQUARE_FEET_TO_SQUARE_CM).round(2)

  puts "The area of the room is #{square_feet} " +
       "square feet (#{square_inches} square inches or " +
        "#{square_cm} square cm)."
end

display_area