# Easy 9: Exercise 10: Grocery List (20 April 2017)

# Write a method which takes a grocery list (array) of fruits with
# quantities and converts it into an array of the correct
# number of each fruit.

def buy_fruit(fruit_array)
  fruit_array.each_with_object([]) do |(fruit, count), result|
    count.times { result << fruit }
  end
end

def buy_fruit(fruit_array)
  fruit_array.map { |fruit, count| [fruit] * count }.flatten
end

p buy_fruit([['apples', 3], ['oranges', 1], ['bananas', 2]]) ==
['apples', 'apples', 'apples', 'oranges', 'bananas', 'bananas']
