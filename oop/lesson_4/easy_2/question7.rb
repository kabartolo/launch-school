# 120 OOP: Lesson 4: Exercises: Easy 2  (28 May 2017)
# Question 7

# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works.
# What code would you need to write to test your theory?

# Answer: This is a class variable and is accessible to all
# instance methods of this class. It keeps track of how many
# cat objects have been created. Each time an instance
# is initialized, the count is incremented by 1.

oscar = Cat.new('Maine Coon')
Cat.cats_count # => 1