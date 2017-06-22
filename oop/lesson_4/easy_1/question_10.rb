# 120 OOP: Lesson 4: Exercises: Easy 1  (23 May 2017)
# Question 10

# If we have the class below, what would you need to call
# to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# we call Bag.new with 2 arguments for the color and material parameters.
leather_bag = Bag.new('brown', 'leather')