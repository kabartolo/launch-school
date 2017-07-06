# 101 Lesson 4: Collections Basics (23 March 2017)

# How would you reference 'grass' from within this string?
# Try it out in irb.

str = 'The grass is green'
str[4, 5]
# or
str.slice(4, 5)
# or
str.slice(4..8)

# What do you think would be returned here?
# Try it out in irb.

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]
arr[2, 3][0]

# => ['c', 'd', 'e']
# => ['c']

# What do you think would be returned by the following
# calls?

str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

str[-6] # => nil
arr[-6] # => nil

arr.fetch(-6) # => IndexError...

# Use fetch to catch index errors in arrays and hashes
hsh = { :a => 1, 'b' => 'two', :c => nil }

hsh['b']       # => "two"
hsh[:c]        # => nil
hsh['c']       # => nil
hsh[:d]        # => nil

hsh.fetch(:c)  # => nil
hsh.fetch('c') # => KeyError: key not found: "c"
               #        from (irb):2:in `fetch'
               #        from (irb):2
               #        from /usr/bin/irb:11:in `<main>'
hsh.fetch(:d)  # => KeyError: key not found: :d
               #        from (irb):3:in `fetch'
               #        from (irb):3
               #        from /usr/bin/irb:11:in `<main>'

# Can you think of a couple of ways in which the items
# in the array could be joined together so that result
# resembles the original string?

str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"
arr.join(' ')   # => 'How do you get to Carnegie Hall?'

# Just like Hash has a #to_a method, Array has a #to_h method.
# What do you think would happen if #to_h was called on the
# following array? Read up on Array#to_h in the Ruby
# documentation and try it out in irb.

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
arr.to_h # => { :name => 'Joe', :age => 10, favorite_color => "blue" }

# Using the same element assignment method, how would you change
# the first letter of the remaining words in the sentence to their
# uppercase versions? Try it out in a code file or in irb.

str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'
str # => "Joe's Favorite Color Is Blue"
# [] is destructive

#In irb or a code file use the same method to increase the value of
# the rest of the integers in the array by 1.
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]
# [] is destructive

#In irb or a code file use the same method to set a value of either
# 'Fruit' or 'Vegetable' to each element in the hash.

hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
hsh # => { :apple => "Fruit", :carrot => "Vegetable", :pear => "Fruit", :broccoli => "Vegetable" }
