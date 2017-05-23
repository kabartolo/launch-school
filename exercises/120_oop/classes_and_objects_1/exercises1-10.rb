# Exercises: 120 Object-Oriented Programming: OO Basics: Classes and Objects 1
# Exercises 1-10

# 1. Update the following code so that, instead of printing the values, each statement prints the name of the class to which it belongs.

# puts "Hello"
# puts 5
# puts [1, 2, 3]

# Expected output:

# String
# Integer               # "Fixnum" if you're using Ruby version older than 2.4.0
# Array

# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

# 2-10

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

# kitty = Cat.new('Maybelline')
# kitty.greet

# Add a getter method #name and invoke it in #greet

class Cat
  def initialize(name)
    @name = name
  end

  def name # or use attr_reader :name above
    @name
  end

  def name=(new_name) # or use attr_writer/attr_accessor
    @name = new_name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

### Use shorthand and add a module

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Maybelline')
kitty.greet
kitty.name = 'Luna'
kitty.greet
kitty.walk