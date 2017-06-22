# 120 OOP: Lesson 4: Exercises: Easy 3  (26 May 2017)
# Question 3

# When objects are created they are a separate realization of a
# particular class.

# Given the class below, how do we create two different instances
# of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

garfield = AngryCat.new(20, 'Garfield')
grumpy_cat = AngryCat.new(10, 'Grumpy Cat')