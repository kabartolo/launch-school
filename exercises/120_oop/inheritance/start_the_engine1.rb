# Exercises: 120 Object-Oriented Programming: OO Basics: Inheritance: 7 June 2017
# Exercise 2

# Start the Engine (Part 1)

# Change the following code so that creating a new Truck automatically invokes
# start_engine.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle

  def initialize(year)
  	super # invokes Vehicle#initialize with all arguments
  	start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year