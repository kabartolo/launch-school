# Easy 2: Exercise 4: When Will I Retire? (30 March 2017)

# Build a program that displays when the user will retire
# and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

require 'date'

def retire_when
  puts "What is your age?"
  current_age = gets.chomp.to_f

  puts "At what age would you like to retire?" 
  retirement_age = gets.chomp.to_f

  years_left = (retirement_age - current_age).to_i
  current_year = Date.today.year
  retirement_year = (current_year + years_left).to_i

  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{years_left} years of work to go!"
end

retire_when
