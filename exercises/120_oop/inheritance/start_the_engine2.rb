# Exercises: 120 Object-Oriented Programming: OO Basics: Inheritance: 7 June 2017
# Exercise 4

# Start the Engine (Part 2)

# Given the following code, modify #start_engine in Truck by
# appending 'Drive fast, please!' to the return value of
# #start_engine in Vehicle. The 'fast' in 'Drive fast, please!'
# should be the value of speed.

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
  	super() + " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')