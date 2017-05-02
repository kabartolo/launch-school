# Easy 8: Exercise 2: Mad Libs (20 April 2017)

# Mad libs are a simple game where you create a story
# template with blanks for words. You, or another player,
# then construct a list of words and place them into the
# story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun,
# a verb, an adverb, and an adjective and injects those into
# a story that you create.
PARTS_OF_SPEECH = %w(noun adjective verb adverb preposition)

def user_input(option)
  puts "#{option.capitalize}:"
  gets.chomp
end

def madlib(phrase)
  madlib = phrase.clone
  PARTS_OF_SPEECH.each { |part| madlib.gsub!(/\b#{part}\b/) { |match| user_input(match) } }

  puts madlib
end

madlib("I enjoy adjective adjective walks preposition the noun.")
madlib("Do you verb your noun adverb? That's adjective!")
