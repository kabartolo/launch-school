# Easy 3: Exercise 2: Arithmetic Integer (31 March 2017)

# Write a program that prompts the user for two positive integers, and
# then prints the results of the following operations on those two
# numbers: addition, subtraction, product, quotient, remainder, and
# power. Do not worry about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

OPERATORS = %w(+ - * / % **)

def prompt(message)
  puts "==> #{message}"
end

def choose_two_nums
  ordinals = %w(first second)

  ordinals.map do |ordinal|
    puts "Enter the #{ordinal} number:"
    gets.chomp.to_i
  end
end

def do_arithmetic(nums)
  puts nums
  OPERATORS.each do |operator|
    result = nums.inject(operator)

    prompt "#{nums.first} #{operator} #{nums.last} = #{result}"
  end

end

numbers = choose_two_nums
do_arithmetic(numbers)