# Exercises: 130: Easy Testing
# 9 August 2017
# Exercise 8

# Kind Assertions

# Write a minitest assertion that will fail if the class
# of value is not Numeric or one of Numeric's subclasses
# (e.g., Integer, Fixnum, Float, etc).

assert_kind_of(Numeric, value)