# Exercises: 120 Object-Oriented Programming: OO Basics: Classes and Objects 2
# Exercises 1-7

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
# kitty.generic_greeting # => undefined method error
kitty.class.generic_greeting # => 'Hello! I'm a cat!'
# The above works because kitty.class returns the Cat class
# and we can then call the class method generic_greeting on it.

class Cat
  COLOR = 'black'
  @@total = 0

  attr_accessor :name

  def initialize(name)
    @name = name
    @@total += 1
  end

  # This works but has setter method syntax even though
  # the Cat class already has a setter method (from attr_accessor)
  # def rename(name)
  #   @name = name
  # end

  # This syntax is preferable. It calls the existing setter
  # method #name=
  def rename(new_name)
    self.name = new_name
  end

  def identify
    self
  end

  def self.total
    "Total cats: #{@@total}"
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Chloe')
puts kitty.name
p kitty.identify
# same as below (kitty is self)
p kitty
puts Cat.total

Cat.generic_greeting
kitty.personal_greeting
puts kitty