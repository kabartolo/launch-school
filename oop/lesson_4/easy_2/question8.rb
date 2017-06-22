# 120 OOP: Lesson 4: Exercises: Easy 2  (28 May 2017)
# Question 8

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo class to allow it to inherit the
# play method from the Game class?

# We can make Bingo a subclass of Game

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

new_game = Bingo.new
new_game.play # => "Start the game!"