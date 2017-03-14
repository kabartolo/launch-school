###  Exercise 3
puts "Starting Exercise 3..."
number = -1
while number < 0
  puts "Enter a number between 0 and 100: "
  number = gets.chomp.to_i
end

case
  when number <= 50
    low = 0
    high = 50
  when number >= 50 && number <= 100
    low = 50
    high = 100
  when number > 100
    low = 100
    high = "infinity"  
end

puts "#{number} is between #{low} and #{high}."

###  Exercise 5

#  Rewrite using if statements, since I've already used 
#  a case statements
puts
puts "Starting Exercise 5..."

def which_range(number)
  if number < 0
    puts "Enter a number between 0 and 100: "
    new_num = gets.chomp.to_i
    return which_range(new_num)  #  needs explicit return
  elsif number <= 50
    low = 0
    high = 50
  elsif number <= 100
    low = 50
    high = 100
  else
    low = 100
    high = "infinity"  
  end

  "#{number} is between #{low} and #{high}."
end

def which_range_case(number)
  if number < 0
    puts "Enter a number between 0 and 100: "
    new_num = gets.chomp.to_i
    return which_range_case(new_num)
  else
    case
    when number <= 50
      low = 0
      high = 50
    when number >= 50 && number <= 100
      low = 50
      high = 100
    when number > 100
      low = 100
      high = "infinity"  
    end
  end

  "#{number} is between #{low} and #{high}."
end

puts "Enter a number between 0 and 100: "
number = gets.chomp.to_i
puts which_range(number)
puts which_range_case(number)