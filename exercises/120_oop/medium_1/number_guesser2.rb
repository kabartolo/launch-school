# Exercises: 120 Object-Oriented Programming: Medium 1
# 16 June 2017
# Exercise 7

# Number Guesser Part 2

# In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

# Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

# Math.log2(size_of_range).to_i + 1

class Guess
	attr_reader :value

	def initialize(value)
		@value = value
	end

	def evaluate(number)
		if value < number
			puts "Your guess is too low!"
		elsif value > number
			puts "Your guess is too high!"
		end
	end

	def to_i
		value.to_i
	end

	def invalid?(min, max)
		value < min || value > max || !integer?
	end

	def integer?
		value.to_s =~ /^[-+]?[0-9]*$/
	end
end

class Player
	attr_accessor :guess_count
	attr_reader :current_guess
	
	def initialize
		@guess_count = nil
		@current_guess = nil
	end

	def guess
		value = gets.chomp.to_i
		@current_guess = Guess.new(value)
	end
end

class GuessingGame
	attr_reader :number

	def initialize(min, max)
		@number = nil
		@player = Player.new
		@min = min
		@max = max
		@guess_limit = Math.log2(max - min).to_i + 1
	end

	def play
		reset_game
		play_round
		end_game
		puts
	end

	def end_game
		if player_wins?
			puts "You win!"
		else
			puts "You are out of guesses. You lose."
			puts "Your number was #{@number}!"
		end
	end

	def reset_game
		@number = rand(@min..@max)
		@player.guess_count = @guess_limit
	end

	def player_wins?
		@player.current_guess.to_i == @number
	end

	def play_round
		loop do
			puts "You have #{@player.guess_count} guesses remaining."
			puts "Enter a number between #{@min} and #{@max}:"
			guess = nil
			loop do
				guess = @player.guess
				break unless guess.invalid?(@min, @max)
				puts "Invalid guess. Enter a number between #{@min} and #{@max}:"
			end
			@player.guess_count -= 1
			guess.evaluate(number)
			return if player_wins? || @player.guess_count == 0
		end
	end
end

# Examples:

game = GuessingGame.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# You win!

# game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low

# You have 1 guesses remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low

# You are out of guesses. You lose.

# Note that a game object should start a new game with a new number to guess with each call to #play.