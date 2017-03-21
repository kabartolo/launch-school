# 1. What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# => 
# 1
# 2
# 2
# 3

# 2. Describe the difference between ! and ? in Ruby.
#    And explain what would happen in the following
#    scenarios:

'1. what is != and where should you use it?
this means "not equal" and should be used in a conditional

2. put ! before something, like !user_name
this means "not user_name" so returns the opposite boolean
of what user_name evaluates to

3. put ! after something, like words.uniq!
this is a style choice to mean the method will mutate
the caller

4. put ? before something
this is used in the ternary operator to return the first result
if the condition evaluates to true, the second if false (if..else)

5.put ? after something
this is a style choice to mean the method returns
a boolean

6. put !! before something, like !!user_name
this can be thought of as "not not user_name" 
so just returns the boolean value of user_name'

# 3. Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!("important", "urgent")
puts advice

# 4. The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5, 1]

# What do the following method calls do (assume we reset numbers to the original
# array between method calls)?

numbers.delete_at(1) # => (permanently) deletes the item at index 1 and returns it
# => 2
numbers.delete(1) # => (permanently) deletes all items in the array that equal 1 and returns 1
# => 1

puts numbers

# 5. Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.'

puts (10..100).include?(42)
puts (10..100).cover?(42)

# 6. Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.
puts "Four score and " << famous_words
puts "Four score and " + famous_words
puts "Four score and #{famous_words}"
puts famous_words.prepend("Four score and ")

# 7. Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# This gives us a string that looks like a "recursive" method call:

"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

# If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call

p eval(how_deep)

# => 42

#Question 8

# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.

p flintstones.flatten!

# 9. Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

p flintstones.assoc("Barney")