# 101 Lessons 2: Pseudocode (14 March 2017)

# Rough pseudocode

"Given a collection of integers.

Iterate through the collection one by one.
  - save the first value as the starting value.
  - for each iteration, compare the saved value with the current value.
  - if the saved value is greater, or it is the same
    - move to the next value in the collection
  - otherwise, if the current value is greater
    - reassign the saved value as the current value

After iterating through the collection, return the saved value."

# Standardized pseudocode

"START

Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator < length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number

END"

# Translation to code

def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num  # assign to first value IF this value is nil
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

puts find_greatest([1, 2, 3, 4, 5])
# => 5

# Refactor

def find_greatest(numbers)
  return if numbers.nil? || numbers.empty?
  
  saved_number = numbers.first # assign to first value once

  numbers.each do |num|
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

puts find_greatest([1, 2, 3, 4, 5])
# => 5

# Exercises

#1. a method that returns two integers

  #Rough pseudocode
   
  "Given two integers
  return the two integer values"


  # Standardized pseudocode

  "START

  Given two integers called a and b
  PRINT a, b

  END"

# 2. a method takes an array of strings, and returns a string
#    that is all those strings concatenated together

  # Rough pseudocode
   
  "Given an array of strings
   
  Save an empty string as the starting result value

  Iterate through the array one by one
  - concatenate the running result with the current string 
   
  After iterating, return the result string"


  # Standardized pseudocode

  "START
  Given an array of strings called string_array

  SET result = empty string

  WHILE iterator < length of string_array
    SET current_string = current value in string_array collection
    result = result + current_string

    iterator = iterator + 1

  PRINT result

  END"

# 3. a method that takes an array of integers, 
#    and returns a new array with every other element

  # Rough pseudocode

  "Given an array of integers
  
  Save an empty array as the new array to return

  Iterate through the array one by one
  - save the index of the current item
  - save the value of the current item
  - if the index is even
    - move to the next value in the array
  - otherwise, if the index is odd
    - add the value to the new array
  After iterating, return the new array" 

  # Standardized pseudocode

  "START

  Given an array of integers called integer_array

  SET new_array = empty array

  WHILE iterator < length of integer_array
    SET current_index = index of current item in integer_array
    SET current_value = value of current item in integer_array
    IF current_index % 2 == 0
      go to the next iteration
    ELSE
      add current_value to new_array

    iterator = iterator + 1

  PRINT new_array

  END"
