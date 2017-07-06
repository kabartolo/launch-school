# 120 OOP: Lesson 4: Exercises: Easy 1  (23 May 2017)
# Question 5
# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name # => instance variable (the @ symbol gives it away)
  end
end

# We can also call #instance_variables to make sure
pizza = Pizza.new('cheese')
pizza.instance_variables
# => [:@name]

orange = Fruit.new('apple')
orance.instance_variables
# => []