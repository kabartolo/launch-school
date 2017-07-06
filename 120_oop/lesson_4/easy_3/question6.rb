# 120 OOP: Lesson 4: Exercises: Easy 3  (26 May 2017)
# Question 6

# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# In the make_one_year_older method we have used self.
# What is another way we could write this method so we don't
# have to use the self prefix?

# Answer: self in this case is referencing the setter method
# provided by attr_accessor - this means that we could replace
# self with @.