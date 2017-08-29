# Exercises: 130: Easy 1
# 10 July 2017
# Exercise 2

# Optional Blocks

# Write a method that takes an optional block. If the
# block is specified, the method should execute it, and
# return the value returned by the block. If no block is
# specified, the method should simply return the String
# 'Does not compute.'.

# Examples:

def compute
	return 'Does not compute.' unless block_given?
	yield
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'


# Further Exploration

# Modify the compute method so it takes a single argument
# and yields that argument to the block. Provide at least
# 3 examples of calling this new version of compute,
# including a no-block call.

def compute(argument)
	return 'Does not compute.' unless block_given?
	yield(argument)
end

puts compute(3) { |b| 5 + b }
puts compute('b') { |b| 'a' + b }
puts compute('nothing')