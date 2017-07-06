def count_to_zero(number)
  if number > 0
    puts number
    count_to_zero(number - 1)
  elsif number == 0
    puts number
  else
    puts "Number can't be negative!"
  end
end

puts count_to_zero(4)
puts count_to_zero(0)
puts count_to_zero(-1)