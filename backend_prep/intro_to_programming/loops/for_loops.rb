#for_loops.rb

x = gets.chomp.to_i

for i in 1..x do
  puts i
end

puts "Done!" 

x = [1, 2, 3, 4, 5]

for i in x do
  puts i
end


a = for i in x do
  puts i
end

puts a #  returns collection of elements