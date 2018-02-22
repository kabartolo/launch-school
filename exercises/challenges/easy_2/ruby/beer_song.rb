# Challenges: Easy 2
# 22 August, 2017
# Exercise 3: Beer Song

# Challenge: Do not use conditionals!
class DefaultBottles
	def initialize(number)
		@number = number
	end

	def display
		"#{@number} bottles of beer"
	end

	def display_phrase
		'Take one down and pass it around'
	end

	def display_next
		DefaultBottles.new(@number - 1).display
	end
end

class NoBottles
	def display
		'no more bottles of beer'
	end

	def display_phrase
		'Go to the store and buy some more'
	end

	def display_next
		DefaultBottles.new(99).display
	end
end

class OneBottle
	def display
		'1 bottle of beer'
	end

	def display_phrase
		'Take it down and pass it around'
	end

	def display_next
		NoBottles.new.display
	end
end

class TwoBottles
	def display_next
		OneBottle.new.display
	end

	def display
		"2 bottles of beer"
	end

	def display_phrase
		'Take one down and pass it around'
	end
end

class BeerSong
	bottle_lookup = { 0 => NoBottles.new,
										1 => OneBottle.new,
										2 => TwoBottles.new }
	
	def verse(number)
		bottles = bottle_lookup.fetch(number) { DefaultBottles.new(number) }

		"#{bottles.display.capitalize} on the wall, #{bottles.display}.\n" \
		"#{bottles.display_phrase}, #{bottles.display_next} on the wall.\n"
	end

	def verses(start, stop)
		start.downto(stop).map { |verse_number| verse(verse_number) }.join("\n")
	end

	def lyrics
		verses(99, 0)
	end
end

puts BeerSong.new.verses(99, 98)
