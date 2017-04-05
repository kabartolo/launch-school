# Easy 3: Exercise 1: Searching 101 (31 March 2017)

# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

def choose_number(ordinal)
  loop do
    puts "Enter the #{ordinal} number:"
    num = gets.chomp

    return num.to_i if num[/^-?\d+$/] # positive/negative integer

    puts "Not a valid number."
  end
end

def searching
  ordinals = %w(1st 2nd 3rd 4th 5th)
  
  numbers = ordinals.map { |ordinal| choose_number(ordinal) }
  last_number = choose_number('last')
  message = numbers.include?(last_number) ? "appears" : "does not appear"
  
  puts "The number #{last_number} #{message} in #{numbers}."
end

searching