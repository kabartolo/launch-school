# 120 OOP: Lesson 4: Exercises: Easy 3  (26 May 2017)
# Question 1

# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi
# => "Hello"

# case 2:

hello = Hello.new
hello.bye
# => undefined method error

# case 3:

hello = Hello.new
hello.greet
# => ArgumentError (greet takes an argument)

# case 4:

hello = Hello.new
hello.greet("Goodbye")
# => "Goodbye"

# case 5:

Hello.hi
# => Undefined method "hi"

# Question 2
# If we call Hello.hi we get an error message.
# How would you fix this?

# Answer: We can change the #hi instance method to a class
# method so that Hello can call it directly.

class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

Hello.hi
# => "Hello"