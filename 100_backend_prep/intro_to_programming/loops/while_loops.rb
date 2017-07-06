# while_loops.rb

x = gets.chomp.to_i

while x >= 0
  puts x
  x = x - 1
end


x = gets.chomp.to_i

while x >= 0
  puts x
  x -= 1 # <- refactored this line
end

puts "Done!"

# until loops

x = gets.chomp.to_i

until x < 0
  puts x
  x -= 1
end

puts "Done!"

loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer.upcase != 'Y'
    break
  end
end