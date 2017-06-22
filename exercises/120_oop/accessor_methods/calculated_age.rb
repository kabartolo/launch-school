# Exercises: 120 Object-Oriented Programming: OO Basics: Accessor Methods
# 7 June 2017
# Exercise 9

# Calculated Age

# Using the following code, multiply @age by 2 upon assignment,
# then multiply @age by 2 again when @age is returned by the
# getter method.

class Person
	def age=(age)
		@age = age * 2
	end

	def age
		@age * 2
	end
end

person1 = Person.new
person1.age = 20
puts person1.age