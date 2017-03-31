# Easy 2: Exercise 8: Sum or Product of Consecutive Integers (31 March 2017)

# Write a program that asks the user to enter an integer greater than
# 0, then asks if the user wants to determine the sum or product of all
# numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def choose_integer
  loop do
    puts "Please enter an integer greater than 0:"
    num = gets.chomp

    return num if num[/^\d+$/] && !num.to_i.zero?

    puts "Not a valid number. Try again."
  end
end

def choose_operation
  valid_ops = ['s', 'p']

  loop do
    puts "Enter 's' to compute the sum, 'p' to compute the product."
    operation = gets.chomp.downcase

    return operation if valid_ops.include?(operation)

    puts "Not a valid operation. Try again."
  end
end

def assess_operation(operation_letter)
  case operation_letter
  when 's' then return 'sum', :+
  when 'p' then return 'product', :*
  end
end

def perform_operation
  num = choose_integer.to_i
  operation_letter = choose_operation
  
  operation, symbol = assess_operation(operation_letter)

  result = (1..num).inject(symbol)
  
  puts "The #{operation} of the integers between 1 and #{num} is #{result}."
end

perform_operation

# Can now be easily extended

def choose_integer
  loop do
    puts ">> Please enter an integer greater than 0:"
    num = gets.chomp

    return num if num[/^\d+$/] && !num.to_i.zero?

    puts "Not a valid number. Try again."
  end
end

def choose_operation
  valid_ops = ['s', 'p', 'd']
  loop do
    puts ">> Enter 's' to compute the sum, 'p' to compute the product,"
    puts ">>       'd' to compute the difference."
    operation = gets.chomp.downcase
    return operation if valid_ops.include?(operation)
    puts "Not a valid operation. Try again."
  end
end

def assess_operation(operation_letter)
  case operation_letter
  when 's' then return 'sum', :+
  when 'p' then return 'product', :*
  when 'd' then return 'difference', :- #  result will be negative
  end
end

def perform_operation
  num = choose_integer.to_i
  operation_letter = choose_operation
  operation, symbol = assess_operation(operation_letter)

  result = (1..num).inject(symbol)
  
  puts "The #{operation} of the integers between 1 and #{num} is #{result}."

end

perform_operation
