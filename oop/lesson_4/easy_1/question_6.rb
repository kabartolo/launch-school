# 120 OOP: Lesson 4: Exercises: Easy 1  (23 May 2017)
# Question 6
# What could we add to the class below to access the instance variable
# @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# Add a getter method or attr_reader

class Cube
  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

# You can also use #instance_variable_get (not a good idea)
big_cube = Cube.new(5000)
big_cube.instance_variable_get("@volume")
# => 5000