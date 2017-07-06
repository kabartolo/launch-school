# iterators.rb


names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']

names.each { |name| puts name }


# with block

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end

# A block is just some lines of code ready to be executed. 
# When working with blocks there are two styles you need to 
# be aware of. By convention, we use the curly braces ({}) 
# when everything can be contained in one line. We use the 
# words do and end when we are performing multi-line operations.