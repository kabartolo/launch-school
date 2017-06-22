# Exercises: 120 Object-Oriented Programming: Easy 2
# 16 June 2017
# Exercise 2

# Correct the following program so it will work properly.
# Assume that the Car class has a complete implementation;
# just make the smallest possible change to ensure that
# cars have access to the drive method.

module Drivable
  def drive
  	puts "I'm driving!"
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

