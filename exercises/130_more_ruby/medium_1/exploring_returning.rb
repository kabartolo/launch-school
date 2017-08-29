# Exercises: 130: Medium 1
# 9 August 2017
# Exercise 7

# Exploring Procs, Lambdas, and Blocks: Returning

# For this exercise, we'll be learning and practicing
# our knowledge of returning from lambdas, procs, and 
# implicit blocks. Run each group of code below: For
# your answer to this exercise, write down your observations
# for each group of code. After writing out those
# observations, write one final analysis that explains
# the differences between procs, blocks, and lambdas.

# Group 1
def check_return_with_proc
  my_proc = proc { return } # returns from the method
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# Group 2
# my_proc = proc { return } # unexpected return (LocalJumpError)
my_proc = proc { puts "hi" }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc) # outputs "hi"

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return } # does not return from the method
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# Group 4
my_lambda = lambda { return } # no error
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# Group 5
def block_method_3
  yield
end

block_method_3 { return } # unexpected return (LocalJumpError)

# Notes
# Program execution for both procs and implicit blocks jumps
# to where the proc or block is defined, and errors are thrown above
# (Group 2, Group 5) because we cannot return from outside the method.
# For a lambda, program execution continues to the next line
# after the call to the lambda, even if it executes a return first.