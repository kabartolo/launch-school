# Exercises: 130: Medium 1
# 9 August 2017
# Exercise 5

# Passing Parameters Part 3

# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce
# the corresponding output shown in numbers 1-4 listed below:

# 1)

gather(items) do |*first_items, last_item|
  puts first_items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)

gather(items) do |first_item, *middle_items, last_item |
  puts first_item
  puts middle_items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)

gather(items) do | first_item, *remaining_items |
  puts first_item
  puts remaining_items.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)

gather(items) do | item1, item2, item3, item4 |
  puts [item1, item2, item3, item4].join(', ')
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
