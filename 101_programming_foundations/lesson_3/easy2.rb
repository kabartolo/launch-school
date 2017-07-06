# 101 Lesson 3: Easy 2 (22 March 2017)

# 1.In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

# Bonus: What are two other hash methods that would
# work just as well for this solution?

puts ages.key?("Spot")
puts ages["Spot"] || false
puts ages.include?("Spot")
puts ages.member?("Spot")

# 2. Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

#Convert the string in the following ways (code will be executed
# on original munsters_description above):

munsters_description.capitalize!
puts munsters_description
# => "The munsters are creepy in a good way."

munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!
puts munsters_description
# => "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description = "The Munsters are creepy in a good way."
munsters_description.downcase!
puts munsters_description
# => "the munsters are creepy in a good way."

munsters_description = "The Munsters are creepy in a good way."
munsters_description.upcase!
puts munsters_description
# => "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# 3. We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
puts ages

# 4. See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.split.include?("Dino")
# better
puts advice.match("Dino")

# 5. Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty Bambam Pebbles)
p flintstones

#6. How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# 7. In the previous exercise we could have used either Array#concat 
# or Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

flintstones += %w(Dino Hoppy)
flintstones.concat(%w(Dino Hoppy))
flintstones.push("Dino").push("Hoppy")
p flintstones

#8. Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".

# Review the String#slice! documentation, and use that method to make the return value 
# "Few things in life are as important as ". But leave the advice variable as "house 
# training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?

start = advice.slice!(0, advice.index('house'))
p advice
p start

# SOLUTION: Using #slice returns "Few things in life are as important as "
# but advice is not mutated

# 9. Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

puts statement.count('t')

#10. Back in the stone age (before CSS) we used spaces to align things on the screen.
# If we had a 40 character wide table of Flintstone family members, how could we easily center
# that title above the table with spaces?

title = "Flintstone Family Members"
puts title.center(40)