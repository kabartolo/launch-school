# 120 OOP: Lesson 4: Exercises: Easy 2  (28 May 2017)
# Question 9

# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class,
# keeping in mind that there is already a method of this name in
# the Game class that the Bingo class inherits from.

# Answer: This would override the #play method in the Game class.
# calling #play on a Bingo instance will use Bingo#play instead
# of Game#play because Ruby searches for a method in the class
# that method is called on first, before looking up the method chain.