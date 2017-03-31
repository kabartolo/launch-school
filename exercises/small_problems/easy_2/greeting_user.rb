# Easy 2: Exercise 5: Greeting a User (31 March 2017)

# Write a program that will ask for user's name. The
# program will then greet the user. If the user writes
# "name!" then the computer yells back to the user.

# Examples

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

def greet_user
  puts "What is your name?"
  name = gets.chomp

  # Allows more punctuation after the first '!'
  name, exclamation = name.partition("!")
  
  greeting = "Hello #{name}."
  if !exclamation.empty?
    greeting += " Why are we screaming?"
    greeting.upcase!
  end

  puts greeting
end

greet_user

# Try modifying our solution to use String#chomp! and String#chop!, respectively.

print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end