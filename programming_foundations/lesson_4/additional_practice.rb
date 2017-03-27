# 101 Lesson 4: Additional Practice (24 March 2017)
# Exercises

# 1. Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values
# are the positions in the array.

def array_to_hash(array)
  hash = {}
  array.each_with_index { |name, i| hash[name] = i }
  hash
end

p array_to_hash(flintstones)

# 2.Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

age_sum = 0
ages.each_value { |value| age_sum += value }

p age_sum

# Equivalent to 
p ages.values.reduce(:+)
# Also! 
p ages.values.inject(:+)

# 3. In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

p ages.reject { |_, age| age >= 100 }

# Also

p ages.keep_if { |_, age| age < 100 } # returns hash
p ages.select { |_, age| age < 100 } # returns nil if no changes made

# 4. Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# 5. In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

p flintstones.index { |name| /be/.match(name.downcase) }

# Also

p flintstones.index { |name| name[0, 2] == "Be" }

# 6. Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name[0, 3] }

# 7. Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

letters = statement.split.join.split('')

letters = letters.each_with_object({}) do |char, hash|
  if !hash[char]
    hash[char] = 1
  else
    hash[char] += 1
  end
end

p letters

# Official solution

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# 8. What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  # p number
  numbers.shift(1)
end
# => skips every second number
# => [1, 3]
# => the next index is 1 but the number at index 1
# has changed

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# => stops after second number
# => [1, 2]

# 9. As we have seen previously we can use some
# built-in string methods to change the case of
# a string. A notably missing method is something
# provided in Rails, but not in Ruby itself...titleize.
# This method in Ruby on Rails creates a string that has
# each word capitalized as it would be in a title.
# For example, the string:
# words = "the flintstones rock"
# would be:
# words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.

def titleize(string)
  words = string.split(' ')
  words.each { |word| word.capitalize! }.join(' ')
end

# If a word is already capitalized, capitalize! here returns nil and does nothing.
# #each just returns the original array that has not been modified

p titleize("the flintstones rock") # => "The Flintstones Rock"
p titleize("The Flintstones Rock") # => "The Flintstones Rock"

# Shorter
def titleize2(string)
  words = "the flintstones rock"
  words.split(' ').map{ |word| word.capitalize! }.join(' ')
end
# => "The Flintstones Rock"

# BUT if a word is already capitalized, capitalize! will return
# nil to map and the result will be "   "

p titleize("The Flintstones Rock") # => "The Flintstones Rock"
p titleize2("The Flintstones Rock") # => "   "

def titleize2(string)
  words = "the flintstones rock"
  words.split(' ').map{ |word| word.capitalize }.join(' ')
end

p titleize("The Flintstones Rock") # => "The Flintstones Rock"
p titleize2("The Flintstones Rock") # => # => "The Flintstones Rock"

#10. Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the family
# member is in (kid, adult, or senior). Your solution should produce the hash below

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
# munsters.each_key do |name|
munsters.each_value do |info| 
  group = case info["age"]
          when 0..17 then "kid"
          when 18..64 then "adult"
          else "senior"
          end
  info["age_group"] = group
end

p munsters
