# Exercises: 120 Object-Oriented Programming: OO Basics: Accessor Methods
# 7 June 2017
# Exercise 1

# Reading and Writing

# Add the appropriate accessor methods to the following code.

class Person
	attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

# => Jessica