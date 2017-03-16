# 101 Lesson 2: Calculator (14 March 2017)

# Changes/Notes after the walkthroughs

'1. CHANGE: Float division instead of integer division
 2. NOTE: If using if statements instead of case statements,
    local variables initialized within if can be accessed
    outside the if (result = nil not necessary)
 3. NOTE: Can write a prompt method to make prompts more obvious
 4. NOTE: "string".to_i is 0 so is_valid?("0") will be true
         so can just use x.to_i != 0 in is_valid?(x)
 5. NOTE: Use the HEREDOC syntax for multi-line strings'


# My attempt before the walkthroughs (before the description of the loop logic for the calculator)
# Assumes input should be only non-zero integers

def is_valid?(x)
  x.to_i.to_s == x.to_s && x != 0
end

a, b, result = nil

loop do
  puts "What is the first (non-zero) number?"
  a = gets.chomp.to_i
  puts "What is the second (non-zero) number?"
  b = gets.chomp.to_i
  break if is_valid?(a) && is_valid?(b)
  puts "Invalid numbers. Try again."
end

while !result
  puts "Should I add, subtract, multiply or divide?"
  operation = gets.chomp.downcase

  result = case operation
  when "add" then a + b
  when "subtract" then a - b
  when "multiply" then a * b
  when "divide" then a.to_f / b.to_f
  end
end

puts "Result: #{result}"


# Walk-through: Refactoring Calculator: Things to Think About

"1. Is there a better way to validate that the user has input a number? 
We'll cover this in more detail in a future assignment.

=> x.to_i.to_s == x.to_s # handles "0" but not "00"

2. It looks like you can call to_i or to_f to convert strings to integers and floats, respectively. 
Look up the String#to_i and String#to_f documentation in Ruby docs and look at their various examples 
and use cases.'

'123.45e1'.to_f        #=> 1234.5
'45.67 degrees'.to_f   #=> 45.67
'thx1138'.to_f         #=> 0.0

'12345'.to_i             #=> 12345
'99 red balloons'.to_i   #=> 99
'0a'.to_i                #=> 0
'0a'.to_i(16)            #=> 10
'hello'.to_i             #=> 0
'1100101'.to_i(2)        #=> 101
'1100101'.to_i(8)        #=> 294977
'1100101'.to_i(10)       #=> 1100101
'1100101'.to_i(16)       #=> 17826049

3. Our operation_to_message method is a little dangerous, because we're relying on the case statement 
being the last expression in the method. What if we needed to add some code after the case statement 
within the method? What changes would be needed to keep the method working with the rest of the program?
We'll show a solution in an upcoming assignment.

=> We could add explicit return statements for each case or use variable = case to return the variable's
   value at on the last line.

4. Most Rubyists don't invoke methods with parentheses, unless they're passing in a parameter. 
For example, we use name.empty?(), but most Rubyists would write name.empty?. Some Rubyists 
even go as far as not putting parentheses around method calls even when passing in parameters. 
For example, they would write prompt 'hi there' as opposed to prompt('hi there').

5. Try removing some of the optional parentheses when calling methods to get your eyes acquainted 
with reading different styles of Ruby code. This will be especially useful if you are using a DSL 
written in Ruby, like Rspec or Rails.

6. We're using Kernel.puts() and Kernel.gets(). But the Kernel. is extraneous as well as the parentheses. 
Therefore, we can just call those methods by gets and puts. We already know that in Ruby we can omit the 
parentheses, but how come we can also omit the Kernel.?

=> From the Ruby doc on the Kernel module: 'The Kernel module is included by class Object, 
so its methods are available in every Ruby object... These methods are called without a receiver and 
thus can be called in functional form.'
=> From Launch School's answer: 'When we write Ruby code that's not in a class, we are working within an object 
called main, which is an instance of Object. The Kernel module is automatically loaded by Object, giving us 
access to all of its methods.'

7. There are lots of messages sprinkled throughout the program. Could we move them into some configuration 
file and access by key? This would allow us to manage the messages much easier, and we could even internationalize
the messages. This is just a thought experiment, and no need to code this up.

=> See calculator_extended.rb"