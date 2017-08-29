# Exercises: 130: Medium 1
# 9 August 2017
# Exercise 3

# Passing Parameters Part 1

# Modify the method below so that the display/output of items
# is moved to a block, and its implementation is left up to the
# user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
	puts "Let's start gathering food."
	yield(items)
	puts "Let's start gathering food."
end

gather(items) { |things| puts "#{things.join(', ')}" }
