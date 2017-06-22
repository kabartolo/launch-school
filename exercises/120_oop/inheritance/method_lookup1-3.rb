# Exercises: 120 Object-Oriented Programming: OO Basics: Inheritance: 7 June 2017
# Exercise 7-9

# Method Lookup (Part 1)

# Using the following code, determine the lookup path used when invoking
# cat1.color. Only list the classes that were checked by Ruby when
# searching for the #color method.

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new('Black')
# cat1.color

# Cat -> Animal

# Method Lookup (Part 2)

# Using the following code, determine the lookup path used when invoking
# cat1.color. Only list the classes and modules that Ruby will check when
# searching for the #color method.

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
puts Cat.ancestors

cat1.color

# Cat -> Animal -> Object -> Kernel -> BasicObject

# Method Lookup (Part 3)

# Using the following code, determine the lookup path used when invoking 
# bird1.color. Only list the classes or modules that were checked by Ruby
# when searching for the #color method.

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color

# Bird -> Flyable -> Animal