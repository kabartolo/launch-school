# Exercise 15
# Delete words beginning with 's'

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |word| word.start_with?('s') }

p arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

# arr.delete_if { |word| word.start_with?('s') || word.start_with?('w') }

# better way
arr.delete_if { |word| word.start_with?('s', 'w') }

p arr