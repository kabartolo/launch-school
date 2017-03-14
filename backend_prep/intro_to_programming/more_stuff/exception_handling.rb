# StandardError
# TypeError
# ArgumentError
# NoMethodError
# RuntimeError
# SystemCallError
# ZeroDivisionError
# RegexpError
# IOError
# EOFError
# ThreadError
# ScriptError
# SyntaxError
# LoadError
# NotImplementedError
# SecurityError


# Ruby has an Exception class that makes handling 
# errors much easier. It also has a syntactic structure 
# using the reserved words begin, rescue, and end to signify 
# exception handling.

begin
  # perform some dangerous operation
rescue
  # do this if operation fails
  # for example, log the error
end

names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end

# inline example


zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "Can't do that!"
puts "After each call"

# => Before each call
#    Can't do that!
#    After each call

# Divide example

def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide(16, 4)
# => 4
puts divide(4, 0)
# => Divided by zero
puts divide(14, 7)
# => 2