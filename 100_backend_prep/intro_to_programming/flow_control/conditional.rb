# conditional.rb

puts "Put in a number"
a = gets.chomp.to_i

if a == 3
  puts "a is 3"
elsif a == 4
  puts "a is 4"
else
  puts "a is neither 3, nor 4"
end

# Notes
# 1-line syntax
if a == 5 then puts "a is 5" end

# append if to the end
puts "a is 7" if a == 7

# unless
puts "a is NOT 3" unless a == 3

# order of precedence
#     <=, <, >, >= - Comparison
#     ==, != - Equality
#     && - Logical AND
#     || - Logical OR

x = true
y = false
z = false

puts x && y || z

# Ternary operator example

irb :001 > true ? "this is true" : "this is not true"
 => "this is true"

irb :001 > false ? "this is true" : "this is not true"
 => "this is not true"