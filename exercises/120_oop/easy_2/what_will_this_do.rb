# Exercises: 120 Object-Oriented Programming: Easy 2
# 16 June 2017
# Exercise 5

# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end
  
  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # => 'ByeBye'
puts thing.dupdata # => 'HelloHello'

