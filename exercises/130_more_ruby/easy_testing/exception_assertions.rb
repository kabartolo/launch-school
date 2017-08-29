# Exercises: 130: Easy Testing
# 9 August 2017
# Exercise 6

# Exception Assertions

# Write a minitest assertion that will fail unless employee.hire
# raises a NoExperienceError exception.

assert_raises(SomeError { employee.hire })
