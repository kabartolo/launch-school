# Exercises: 120 Object-Oriented Programming: OO Basics: Inheritance: 7 June 2017
# Exercise 10

# Transportation

# Create a module named Transportation that contains three classes: 
# Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.

# Namespacing

module Transportation

	class Vehicle
	end

	class Truck < Vehicle
	end

	class Car < Vehicle
	end

end

truck = Transportation::Truck.new