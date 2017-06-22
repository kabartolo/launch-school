# Exercises: 120 Object-Oriented Programming: Easy 2
# 16 June 2017
# Exercise 8

# What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

# Solution:
# Remove the self prefix from line 13.
# Else there is a NoMethodError: 
#'to_s': private method 'expand' called for #<Expander...>

# This is because private methods can never be called
# with an explicit receiver even when that receiver is self.