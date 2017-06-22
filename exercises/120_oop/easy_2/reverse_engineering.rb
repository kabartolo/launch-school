# Exercises: 120 Object-Oriented Programming: Easy 2
# 16 June 2017
# Exercise 4

# Write a class that will display:

# ABC
# xyz

# when the following code is run:

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
	def initialize(string)
		@string = string
	end

	def uppercase
		@string.upcase
	end

	def self.lowercase(string)
		string.downcase
	end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
