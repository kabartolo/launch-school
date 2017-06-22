# Exercises: 120 Object-Oriented Programming: Easy 2
# 16 June 2017
# Exercise 9

# # Solution notes:
# However, if you recall from the OOP book, modules are more appropriate in
# a has-a relationship. While it is sometimes tricky to choose one or the
# other, a great guideline is to decide if you want some additional
# functionality, or if you want to extend the abilities of the class.
# In this case, it is pretty clear that we need the functionality of walking;
# 	we don't need to extend the abilities of class Person(extending the abilities
# 	of a class coincides with an is-a relationship, not has-a).

# You have the following classes.

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

# You need to modify the code so that this works:

# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# # => "Flash runs forward"


# # Solution with subclasses (not ideal)
# class Animal
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
  
#   def walk
#   	puts "#{name} #{gait} foward"
#   end
# end


# class Person < Animal

#   protected

#   def gait
#     "strolls"
#   end
# end

# class Cat < Animal

#   protected

#   def gait
#     "saunters"
#   end
# end

# class Cheetah < Animal

#   protected

#   def gait
#     "runs"
#   end
# end

# Solution with Walkable module (better)

module Walkable
	def walk
		puts "#{name} #{gait} foward"
	end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"