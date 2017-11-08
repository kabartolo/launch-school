# Exercises: 120 Object-Oriented Programming: Easy 2
# 16 June 2017
# Exercise 10

# Nobility

# Now that we have a Walkable module, we are given a new challenge.
# Apparently some of our users are nobility, and the regular way of
# walking simply isn't good enough. Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:

module Walkable
	def walk
		"#{self} #{gait} foward"
	end
end

class Person
	attr_reader :name

	include Walkable

	def initialize(name)
		@name = name
	end

	def gait
		"strolls"
	end

	def to_s
		name
	end
end

class Noble < Person
	attr_reader :title

	def initialize(name, title)
		super(name)
		@title = title
	end

	def gait
		"struts"
	end

	def to_s
		"#{title} #{name}"
	end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other
# purposes that we aren't showing here.

byron.name
# => "Byron"
byron.title
# => "Lord"
# 