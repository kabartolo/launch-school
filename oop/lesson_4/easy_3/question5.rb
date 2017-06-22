# 120 OOP: Lesson 4: Exercises: Easy 3  (26 May 2017)
# Question 5

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # => no method "manufacturer"
tv.model # => returns #model method return value

Television.manufacturer # returns self.manufactor return value
Television.model # => no method "model"
