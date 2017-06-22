# 120 OOP: Lesson 4: Exercises: Easy 2  (28 May 2017)
# Question 6

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you
# know? How would you call a class method?

# self.manufacturer is the class method because it is prefixed
# with 'self.'
# We can call it on the class itself, i.e., Television.manufacturer