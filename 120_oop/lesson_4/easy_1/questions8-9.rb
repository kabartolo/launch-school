# 120 OOP: Lesson 4: Exercises: Easy 1  (23 May 2017)
# Question 8

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

# You can see in the make_one_year_older method
# we have used self. What does self refer to here?

# Answer:
# self refers to object that #make_one_year_older is 
# called on. This object will be an instance of the Cat 
# class.

# Question 9
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

# In the name of the cats_count method we have
# used self. What does self refer to in this context?

# Answer:
# self here refers to the Cat class itself. This means
# self.cats_count is a Class method (not an instance method)