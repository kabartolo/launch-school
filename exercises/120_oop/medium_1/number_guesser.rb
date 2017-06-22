# Exercises: 120 Object-Oriented Programming: Medium 1
# 16 June 2017
# Exercise 6

# Number Guesser Part 1

# Create an object-oriented number guessing class for numbers in the range 1 to 100,
# with a limit of 7 guesses per game. 
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

	def invalid?
		value < GuessingGame::MIN || value > GuessingGame::MAX || !integer?
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
	MAX_GUESSES = 7
	MIN = 1
	MAX = 100

	attr_reader :number

	def initialize
		@number = nil
		@player = Player.new
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
		@number = rand(MIN..MAX)
		@player.guess_count = MAX_GUESSES
	end

	def player_wins?
		@player.current_guess.to_i == @number
	end

	def play_round
		loop do
			puts "You have #{@player.guess_count} guesses remaining."
			puts "Enter a number between #{MIN} and #{MAX}:"
			guess = nil
			loop do
				guess = @player.guess
				break unless guess.invalid?
				puts "Invalid guess. Enter a number between #{MIN} and #{MAX}:"
			end
			@player.guess_count -= 1
			guess.evaluate(number)
			return if player_wins? || @player.guess_count == 0
		end
	end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# You win!

game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low
# You are out of guesses. You lose.

# Note that a game object should start a new game with a new number to guess with each call to #play.