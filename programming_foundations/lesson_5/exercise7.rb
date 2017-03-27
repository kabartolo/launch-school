# 101 Lesson 5: Exercises (27 March 2017)
# Exercise 5

# Given this code, what would be the final values of a
# and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a
# => 2
p b
# => [3, 8]
arr # => [4, [3, 8]]