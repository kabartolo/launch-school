# 120 OOP: Lesson 4: Exercises: Easy 2  (28 May 2017)
# Question 3

# How do you find where Ruby will look for a method when that
# method is called? How can you find an object's ancestors?

# Answer: 
# You can find an objects ancestors by calling the #ancestors
# method on it. This is the object's lookup chain.
# This tells you where Ruby will look for a method.

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

# Orange -> Taste
# Orange -> HotSauce