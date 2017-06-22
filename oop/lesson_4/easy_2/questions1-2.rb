# 120 OOP: Lesson 4: Exercises: Easy 2  (26 May 2017)
# Question 1

# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling:

oracle = Oracle.new
oracle.predict_the_future

# The instance method #predict_the_future returns a string
# "You will " concatenated to the return value of the 
# instance method #choices, which is a random item from an
# array of strings. The overall result is a string of the form
# "You will <do something>".

# Question 2
# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# This goes through the same process as in Question 1 except 
# it uses the #choices method from RoadTrip instead of Oracle.
# RoadTrip overrides Oracle's #choice method. Ruby does this via
# its method lookup path. It will search the called class for a method
# and use it before it searches modules and superclasses.