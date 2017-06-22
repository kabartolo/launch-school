# 120 OOP: Lesson 4: Exercises: Easy 1  (23 May 2017)
# Question 2

# If we have a Car class and a Truck class and we want to be able
# to go_fast, how can we add the ability for them to go_fast
# using the module Speed? How can you check if your Car or Truck
# can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

my_car = Car.new
my_car.go_fast
my_truck = Truck.new
my_truck.go_fast

# Question 3
# In the last question we had a module called Speed which
# contained a go_fast method. We included this module in the
# Car class as shown below.

module Speed
  def go_fast
    # puts "I am a #{self.class} and going super fast!"
    puts self.class.class
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car
# class (as shown below) you might have noticed that the string
# printed when we go fast includes the name of the type of
# vehicle we are using. How is this done?

small_car = Car.new
small_car.go_fast
# I am a Car and going super fast!

# This is done by calling self.class. Self refers to the receiver
# of the method, the object itself. The #class method returns a Class (the
# class of the receiving object). In this case it is called on an instance
# of Car, so self.class returns Car.