# Notes for Hashes chapter

# As of version 1.9 hashes maintain the order in which they're stored


person = { height: '6 ft', weight: '160 lbs' }
person[:hair] = 'brown'
person[:age] = 62

person.delete(:age)
h.delete_if { |key, value| value == 'brown' }

puts person[:weight]

person.merge!({ eyes: 'blue' }) # permanent change with !
puts person

person.each do |key, value|
  puts "Bob's #{key} is/are #{value}."
end

# Use the old style when deviating from symbols as keys
hash_as_array = {1 => "apples", 2 => "oranges"}
puts hash_as_array[1]

# Hashes vs Arrays

# Does this data need to be associated with a specific label? If yes, use a hash. If the data doesn't have a natural label, then typically an array will work fine.

# Does order matter? If yes, then use an array. As of Ruby 1.9, hashes also maintain order, but usually ordered items are stored in an array.

# Do I need a "stack" or a "queue" structure? Arrays are good at mimicking simple "first-in-first-out" queues, or "last-in-first-out" stacks.

# Common hash methods

puts person.has_key?(:age) # => false
puts person.select { |key, value| key == :hair }
# => { :hair => "brown" }
puts person.fetch(:weight) # => "160 lbs"
puts person.fetch(:age, "Age not provided.")
# option if key is not found
p person.to_a # => [[:height, "6 ft"], [:weight, "160 lbs"]...]
# to_a does not modify the original hash

person.keys # returns an array
person.values # returns an array

