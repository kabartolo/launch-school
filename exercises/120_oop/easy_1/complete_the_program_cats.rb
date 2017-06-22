# Exercises: 120 Object-Oriented Programming: Easy 1
# 8 June 2017
# Exercise 9

# Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
	def initialize(name, age, colours)
		super(name, age)
		@colours = colours
	end

	def to_s
		"My cat #{@name} is #{@age} years old and has #{@colours} fur."
	end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Update this code so that when you run it, you see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.
