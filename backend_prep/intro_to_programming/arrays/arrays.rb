# Array methods

a = [1, 2, 3, 4, 5]
a.include?(3) # => true

a = [1, 2, [3, 4, 5], [6, 7]]
a.flatten # => [1, 2, 3, 4, 5, 6, 7]
p a #  not mutated

a.each_index { |i| puts i }

a = [3, 4, 6, 2, 1]
a.sort
p a #  not mutated

a = [1, 2, 3]
a.product([4, 5])
# => [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]
# does not mutate original array
p a # => [1, 2, 3]

# EACH vs MAP
a = [1, 2, 3]
a.each { |e| puts e }

# Outputs
1
2
3
=>[1, 2, 3] # returns the collection it was invoked on

# BUT 
a = [1, 2, 3]
a.map { |x| x**2}
=> [1, 4, 9] # returns a new array

a = [1, 2, 3]
a.map { |x| puts x**2 }
=> [nil, nil, nil] # each nil returned from puts in block

# Mutation

array = [1, "Bob", 4.33, "another string"]

p array.pop
p array # mutated

p array.delete(array.first) # => returns 1  !!

array << "another string"
p array

# map does not mutate the caller
array = [1, 2, 3, 4]
array.map do |num|
  num * num
end

p array

# uniq method

array = [1, 2, 3, 1, 1]
p array.uniq # returns a new array
p array # not mutated

p array.uniq! # bang operator mutates 
p array # mutated!

# select method

array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p array.select { |number| number > 4 }
p array # not mutated