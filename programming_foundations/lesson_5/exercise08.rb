# 101 Lesson 5: Exercises (27 March 2017)
# Exercise 8

# Using the each method, write some code to output all of
# the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |array|
  array.each do |word|
    word.each_char do |char|
      puts char if 'aeiou'.include?(char)
    end
  end
end