# 101 Lesson 5: Exercises (27 March 2017)
# Exercise 15

# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_array = arr.select do |hash|
  hash.all? do |_, array|
    array.all? do |num|
      num.even?
    end
  end
end

p new_array
# => [{:e=>[8], :f=>[6, 10]}]
