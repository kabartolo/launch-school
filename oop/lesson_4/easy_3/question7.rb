# 120 OOP: Lesson 4: Exercises: Easy 3  (26 May 2017)
# Question 7

# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# We never use the brightness and color attributes.
# We don't need the return keyword on line 15.