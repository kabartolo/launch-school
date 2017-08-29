# Exercises: 130: Medium 1
# 9 August 2017
# Exercise 6

# Exploring Procs, Lambdas, and Blocks: Definition and Arity

# For this exercise, we'll be learning and practicing our
# knowledge of the arity of lambdas, procs, and implicit blocks.
# Two groups of code also deal with the definition of a Proc
# and a Lambda, and the differences between the two. Run each
# group of code below: For your answer to this exercise, write
# down your observations for each group of code. After writing
# out those observations, write one final analysis that explains
# the differences between procs, blocks, and lambdas.

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."}

# A proc is an object of the Proc class which can be created using the proc keyword
# instead of Proc.new.
# A proc can take any number of arguments.
# A lambda is also an object of the Proc class. 
# There is no Lambda class. A lambda can be created with the
# lambda keyword or ->
# A lambda requires the number of arguments specified in its block.

# The yield keyword raises an error if no block is passed.
# A block passed to a method does not require the correct number
# of arguments. So, nil will be assigned if no value is passed to a defined
# block variable, and nil will be assigned to remaining variables
# if the block is passed too few arguments.

# Comparison

#  Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
#  Lambdas enforce the number of arguments passed to them. Implicit block and Procs do not enforce the number of arguments passed in.
