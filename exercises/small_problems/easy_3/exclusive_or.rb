# Easy 3: Exercise 6: Exclusive Or (31 March 2017)

# The || operator returns true if either or both of its
# operands are true, false if both operands are false. The
# && operator returns true if both of its operands are true
#, and false if either operand is false. This works great
# until you need only one of two conditions to be true, the
# so-called exclusive or.

# In this exercise, you will write a method named xor that
# takes two arguments, and returns true if exactly one of
# its arguments is true, false otherwise.

def xor?(a, b)
  (a && !b) || (b && !a)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# Further exploration

# Can you think of a situation in which a boolean xor method
# would be useful? Suppose you were modeling a light at the 
# top of a flight of stairs wired in such a way that the
# light can be turned on or off using either the switch at
# the bottom of the stairs or the switch at the top of the
# stairs. This is an xor configuration, and it can be modeled
# in ruby using the xor? method. Think of some additional
# examples.
# SOLUTION:
#   - 

# || and && are so-called short circuit operators in that the
# second operand is not evaluated if its value is not needed.
# Does the xor method perform short-circuit evaluation of its
# operands? Why or why not? Does short-circuit evaluation 
# in xor operations even make sense?
# SOLUTION:
#   In my implementation it makes sense. If a is true
# and b is not true for the first operand, xor will return true
# and not evaluate the second operand.