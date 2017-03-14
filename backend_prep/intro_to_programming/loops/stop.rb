loop do
  puts "Tell me something, or say STOP to exit."
  input = gets.chomp
  if input == "STOP" then break end
  puts "#{input}!"
end

# does not exit immediately upon inputing "STOP"; continues and evaluates the last puts
input = ''
while input != "STOP"
  puts "Tell me something, or say STOP to exit."
  input = gets.chomp
  puts "#{input}!"
end

# workaround for above while loop issue

puts "Tell me something, or say STOP to exit."
input = gets.chomp
while input != "STOP"
  puts "#{input}!"
  puts "Tell me something, or say STOP to exit."
  input = gets.chomp
end

while true #  => works like the loop block above
  puts "Tell me something, or say STOP to exit."
  input = gets.chomp
  if input == "STOP" then break end
  puts "#{input}!"
end

# just repeat the condition

input = ''
while input != "STOP"
  puts "Tell me something, or say STOP to exit."
  input = gets.chomp
  if input != "STOP"
    puts "#{input}!"
  end
end