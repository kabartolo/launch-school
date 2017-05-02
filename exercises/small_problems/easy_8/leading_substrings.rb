# Easy 8: Exercise 3: Leading Substrings (20 April 2017)

# Write a method that returns a list of all substrings of a
# string that start at the beginning of the original string.
# The return value should be arranged in order from shortest
# to longest substring.

def substrings_at_start(string)
  substrings = []
  0.upto(string.length - 1) { |i| substrings << string[0..i] }

  substrings
end

def substrings_at_start(string)
  (0..string.length - 1).each_with_object([]) { |i, result| result << string[0..i] }
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
