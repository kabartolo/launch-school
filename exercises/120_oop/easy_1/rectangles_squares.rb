# Exercises: 120 Object-Oriented Programming: Easy 1
# 8 June 2017
# Exercise 8

# Rectangles and Squares

# Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

# Write a class called Square that inherits from Rectangle, and is used
# like this:

# square = Square.new(5)
# puts "area of square = #{square.area}"

class Square < Rectangle
	def initialize(side_length)
		super(side_length, side_length)
	end
end

square = Square.new(5)
puts "area of square = #{square.area}"