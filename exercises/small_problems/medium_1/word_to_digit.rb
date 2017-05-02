# Medium 1: Exercise 7: Word to Digit  (2 May 2017)

# Write a method that takes a sentence string as input, and 
# returns a new string that contains the original string with
# any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string
# of digits.

WORDS_TO_DIGITS = %w(one two three four five six seven eight nine)
                  .zip(('1'..'9').to_a)
                  .to_h

# Case insensitive
def word_to_digit(string)
  WORDS_TO_DIGITS.each_with_object(string) do |(word, digit), result|
    result.gsub!(/#{word}/i, digit)
  end
end

# Test cases
string = 'Please call me at five five five one two three four. Thanks.'

puts word_to_digit(string) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts word_to_digit('Please call me at Five Five five one TWO three fouR. Thanks.')

# (Method modifies original string)
puts string # => 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# Further exploration
# Remove whitespace between newly added digits and format 10-digit numbers as telephone numbers
def word_to_digit(string)
  new_string = WORDS_TO_DIGITS.each_with_object(string) do |(word, digit), result|
    result.gsub!(/#{word}\s*/i, digit)
  end

  digits = new_string.match(/(\d+)/)[1]
  digits.length == 10 ? new_string.gsub!(digits, format_telephone_number(digits)) : new_string
end

def format_telephone_number(string)
  "(#{string[0..2]}) #{string[3..5]}-#{string[6..9]}"
end

puts word_to_digit('Please call me at Five Five five one TWO three fouR. Thanks.')
# => Please call me at 5551234. Thanks.
puts word_to_digit('Please call me at one one one five five five one two three four. Thanks.')



