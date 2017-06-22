# 120 OOP: Lesson 4: Exercises: Hard 1  (28 May 2017)
# Question 2

# Ben and Alyssa are working on a vehicle management system. So far,
# they have created classes called Auto and Motorcycle to represent automobiles and
# motorcycles. After having noticed common information and calculations they were
# performing for each type of vehicle, they decided to break out the commonality into
# a separate class called WheeledVehicle. This is what their code looks like so far:

class WheeledVehicle
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

# Now Alan has asked them to incorporate a new type of vehicle into their system - a
# Catamaran defined as follows:

# class Catamaran
#   attr_accessor :propeller_count, :hull_count, :speed, :heading

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     # ... code omitted ...
#   end
# end

# This new class does not fit well with the object hierarchy defined so far. Catamarans
# don't have tires. But we still want common code to track fuel efficiency and range. 
# Modify the class definitions and move code into a Module, as necessary, to share code
# among the Catamaran and the wheeled vehicles.

# NOTE: Compare official solution to mine. Mine works but is not the preferred way. See
# official solution below.
module Drivable
  def range
    @fuel_capacity + @fuel_efficiency
  end
end

class WheeledVehicle
  attr_accessor :speed, :heading

  include Drivable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

# class Catamaran
#   attr_accessor :propeller_count, :hull_count, :speed, :heading

#   include Drivable

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     # ... code omitted ...
#   end
# end

# car = Auto.new
# puts car.range

# Official solution
# Everything related to moveability is in one place.
# The module "owns" the fuel_capacity and fuel_efficiency variables, so it
# controls them. Since we have setters for them, we should use the setters
# in the initialize method (with self).

module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

# class Catamaran
#   include Moveable

#   attr_accessor :propeller_count, :hull_count

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     self.fuel_efficiency = km_traveled_per_liter
#     self.fuel_capacity = liters_of_fuel_capacity

#     # ... other code to track catamaran-specific data omitted ...
#   end
# end

# Question 3
# Building on the prior vehicles question, we now must also track a basic motorboat.
# A motorboat has a single propeller and hull, but otherwise behaves similar to a
# catamaran. Therefore, creators of Motorboat instances don't need to specify number
# of hulls or propellers. How would you modify the vehicles code to incorporate a new
# Motorboat class?

class WaterVehicle
  include Moveable

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity

    # ... other code to track catamaran-specific data omitted ...
  end
end

class MotorBoat < WaterVehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class Catamaran < WaterVehicle
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super # passes along all arguments to the superclass
  end
end

# motorboat = MotorBoat.new(50, 50)
# puts motorboat.range

# Question 4

# The designers of the vehicle management system now want to make an adjustment
# for how the range of vehicles is calculated. For the seaborne vehicles, due
# to prevailing ocean currents, they want to add an additional 10km of range
# even if the vehicle is out of fuel.

# Alter the code related to vehicles so that the range for autos and motorcycles
# is still calculated as before, but for catamarans and motorboats, the range
# method will return an additional 10km.

# This works but it's better to just override the #range method (see below)
module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    self.class::BASE_RANGE + (@fuel_capacity * @fuel_efficiency)
  end
end

class WheeledVehicle
  BASE_RANGE = 0

  # code omitted
end

class WaterVehicle
  BASE_RANGE = 10

  include Moveable

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
    # ... other code to track catamaran-specific data omitted ...
  end
end

class Catamaran < WaterVehicle
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super # passes along all arguments to the superclass
  end
end

catamaran = Catamaran.new(2, 2, 40, 10.0)
puts catamaran.range

# Better solution

class WaterVehicle
  include Moveable

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
    # ... other code to track catamaran-specific data omitted ...
  end

  # My solution
  # def range
  #   10 + (@fuel_efficiency * @fuel_capacity)
  # end

  # Can use super keyword to actually call the module method
  # and use its return value
  def range
    range_by_using_fuel = super
    return range_by_using_fuel + 10
  end
end

class Catamaran < WaterVehicle
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super # passes along all arguments to the superclass
  end
end

catamaran = Catamaran.new(2, 2, 40, 10.0)
puts catamaran.range
