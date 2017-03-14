# Arrays: Exercise 7

array = [1, 2, 3]

new_array = array.map { |num| num + 2 }

p array
p new_array

# OR 

new_array = []
array.each do |num|
  new_array << num + 2
end

p array
p new_array

# NOTE the following does not create a new array
# since the original array is not mutated and here new_array
# is set to the value of the original array

new_array = array.each do |num|
  new_array << num + 2
end