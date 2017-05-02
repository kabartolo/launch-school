# Easy 9: Exercise 2: Double Doubles (20 April 2017)

# A double number is a number with an even number of digits whose
# left-side digits are exactly the same as its right-side digits.
# For example, 44, 3333, 103103, 7676 are all double numbers. 444,
# 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned
# as-is.

def is_double?(number)

end

def is_double?(number)
  divisor = 10**(number.to_s.size / 2)
  number / divisor == number % divisor
end

def twice(number)
  is_double?(number) ? number : number * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
puts twice(0) == 0