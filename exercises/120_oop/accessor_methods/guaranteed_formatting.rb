# Exercises: 120 Object-Oriented Programming: OO Basics: Accessor Methods
# 7 June 2017
# Exercise 6

# Guaranteed Formatting

# Using the following code, add the appropriate accessor methods so that
# @name is capitalized upon assignment.

class Person
	attr_reader :name
	
	def name=(name)
		@name = name.capitalize
	end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
