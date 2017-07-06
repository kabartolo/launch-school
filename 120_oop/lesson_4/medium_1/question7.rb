# 120 OOP: Lesson 4: Exercises: Medium 1  (26 May 2017)
# Question 7

# How could you change the method name below so that the
# method name is more clear and less repetitive.

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information # => change to information so we can call Light.information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end
