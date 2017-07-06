# 120 OOP: Lesson 2: Inheritance  (20 May 2017)

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim
puts teddy.fetch
puts teddy.jump
puts teddy.run

fluffy = Bulldog.new
puts fluffy.swim

felix = Cat.new
puts felix.speak
puts felix.jump
# felix.fetch

# Class hierarchy
#           Pet (run, jump)
#         |                     |
# Dog (swim, fetch, speak)  Cat (speak)
#        |
# Bulldog (swim)


# Method lookup path (for Bulldog.swim)
# The lookup path is the order in which ruby will traverse the 
# class hierarchy to look for methods to invoke.
# This is important because we want ruby to look at the current
# class for a method before it starts looking further on the chain
# so that a class's superclass methods can be overriden.

# Bulldog
# Dog
# Pet
# Object
# Kernel
# BasicObject
