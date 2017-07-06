# 120 OOP: Lesson 4: Exercises: Easy 2  (28 May 2017)
# Question 4

# What could you add to this class to simplify it and remove
# two methods from the class definition while still maintaining
# the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# Answer

# Add attr_accessor :type and remove the #type and #type= methods.
# The attr_accessor automatically creates these getter and
# setter methods.
# We can also remove the @ symbol in "I am a #{@type} of Bees Wax"
# since there is a getter method.