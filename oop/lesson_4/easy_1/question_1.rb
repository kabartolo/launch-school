# 120 OOP: Lesson 4: Exercises: Easy 1  (23 May 2017)
# Question 1
# Which of the following are objects in Ruby? If they are objects,
# how can you find out what class they belong to?

    true
    "hello"
    [1, 2, 3, "happy days"]
    142
    
# They are all objects. You can find their class by calling the
# Object#class method.
p true.class # => TrueClass
p "hello".class # => String
p [1, 2, 3, "happy days"].class # => Array
p 142.class # => Fixnum