# 101 Lessons 2: Flow charts (14 March 2017)

"while user wants to keep going
  - ask the user for a collection of numbers
  - extract the largest one from that collection and save it
  - ask the user if they want to input another collection

return saved list of numbers"

"START

SET large_numbers = []
SET keep_going = true

WHILE keep_going == true
  GET "enter a collection"
  SET collection
  SET largest_number = SUBPROCESS "extract the largest one from that collection"
  large_numbers.push(largest_number)
  GET "enter another collection?"
  IF "yes"
    keep_going = true
  ELSE
    keep_going = false
  IF keep_going == false
    exit the loop

PRINT large_numbers

END"

# Note the SUBPROCESS keyword that keeps this pseudocode short
# and easier to understand. 
# This is a declarative code segment. Its imperative logic
# is outlined elsewhere.
# This SUBPROCESS can be added in a rectangle in a flow chart.
