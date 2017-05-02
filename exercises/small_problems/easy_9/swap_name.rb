# Easy 9: Exercise 7: Name Swapping (20 April 2017)

# Write a method that takes a first name, a space, and a last
# name passed as a single String argument, and returns a
# string that contains the last name, a comma, a space,
# and the first name.

def swap_name(name_string)
  first_name, last_name = name_string.split
  "#{last_name}, #{first_name}"
end

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
puts swap_name('') == ', '