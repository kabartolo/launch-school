# Easy 3: Exercise 7: Odd Lists (5 April 2017)

# Write a method that returns an Array that contains every
# other element of an Array that is passed in as an argument.
# The values in the returned list should be those values
# that are in the 1st, 3rd, 5th, and so on elements of the
# argument Array.

def oddities(array)
  array.select.with_index { |item, index| index.even? }
end

#Examples:

p oddities([2, 3, 4, 5, 6])
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# Long way 'round

def oddities(array)
  odd_items = []
  index = 0
  while index < array.size
    odd_items << array[index]
    index += 2
  end
  odd_items
end

# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
def non_oddities(array)
  array.select.with_index { |item, index| index.odd? }
end

p non_oddities([2, 3, 4, 5, 6]) == [3, 5]
p non_oddities(['abc', 'def']) == ['def']
p non_oddities([123]) == []
p non_oddities([]) == []

# Try to solve this exercise in at least 2 additional ways.

def oddities(array)
  odd_items = []
  array.each_with_index do |item|
    odd_items << array[index] if index.even?
  end
  odd_items
end

def oddities(array)
  index = -1
  array.select do |item|
    index += 1
    index.even?
  end
end

# Not right
def oddities(array)
  (0..array.size).step(2).map { |i| array[i] }
end
# oddities(['abc', 'def']) 
# => ['abc', nil]

# Use three dots in ellipsis to exclude the end value
def oddities(array)
  (0...array.size).step(2).map { |i| array[i] }
end
# oddities(['abc', 'def']) 
# => ['abc']

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
