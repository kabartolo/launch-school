# 101 Lesson 4: Methods and More Methods (23 March 2017)
# Exercises

# 1. What is the return value of the select method below?
# Why?

[1, 2, 3].select do |num|
  num > 5
  'hi' # => truthy!
end

# => [1, 2, 3]
# The select method selects items based on the block's
# return value's truthiness. A string is truthy!

# 2. How does count treat the block's return value?
# How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2
# The Ruby doc on the #count method tells us if a block
# is given it counts the number of elements yielding
# a true value.

# 3. What is the return value of reject in the following
# code? Why?

[1, 2, 3].reject do |num|
  puts num # => falsey!
end

# => [1, 2, 3]
# This acts similary to select but does the opposite.
# It rejects an item if its block's return value evaluates
# to true and selects it if it is "falsey"

# 4. What is the return value of each_with_object in the
# following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# #each_with_object returns the given object after 
# passing it into the block

# 5. What does shift do in the following code? How can we
# find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# => [ :a => 'ant' ]
# => shift returns and removes the first item in the hash
# as a two-item array [ key, value ]

# 6. What is the return value of the following statement?
# Why?

['ant', 'bear', 'caterpillar'].pop.size

# => 11
# Because the return value of pop is the last item in
# the array ('caterpillar') and its size is 11

#7. What is the block's return value in the following code?
# How is it determined? Also, what is the return value of
# any? in this code. What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The block's return value is true/false determined
# by the line num.odd?
# The return value is true/false
# This code outputs each number and then returns true
# NOTE: any? stops iterating after the first loop since it
# found an item that returns true

# 8. How does take work? Is it destructive? How can we
# find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2]
# It returns the first n elements from the array as a new array

# 9. What is the return value of map in the following
# code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, "bear"]
# Because map transforms each item based on the return
# value of its block. The if statement returns 'nil'
# for 'ant'.size > 3 (since it's not) because its 
# condition is not evaluated

# 10. What is the block's return value in the following
# code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]
# The if statement returns "puts num" for the last
# two elements, which in turn returns "nil"