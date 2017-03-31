# Easy 2: Exercise 1: How Old is Teddy? (30 March 2017)

# Build a program that randomly generates and
# prints Teddy's age. To get the age, you
# should generate a random number between
# 20 and 200.

# Example Output

# Teddy is 69 years old!

def how_old_is_teddy
  puts "Teddy is #{rand(20..200)} years old!"
end

how_old_is_teddy

# Modify this program to ask for a name, and then print the
# age for that person. For an extra challenge, use "Teddy" as
# the name if no name is entered.

def how_old()
  puts "What is your name?"
  name = gets.chomp
  name = 'Teddy' if name == ''

  age = rand(20..200)

  puts "#{name} is #{age} years old!"
 end  

 how_old()