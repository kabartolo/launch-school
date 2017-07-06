# 101 Lesson 4: Loops (23 March 2017)

# Let's now take a look at an example with hashes. In this example we want to select
# the key-value pairs where the value is 'Fruit'.
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(list)
  list_keys = list.keys 
  selected_words = {}
  counter = 0

  loop do
    break if counter == list_keys.size

    current_word = list_keys[counter]
    if hash[current_word] == 'Fruit'
      selected_words[current_word] = 'Fruit'
    end
    counter += 1
  end

  selected_words
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def general_select(list, selection_criteria)
  item_keys = list.keys
  counter = 0
  selected_items = {}

  loop do
    break if counter == item_keys.size

    current_key = item_keys[counter]
    current_value = list[current_key]

    if current_value == selection_criteria
      selected_items[current_key] = current_value
    end

    counter += 1
  end

  selected_items
end

#Can you implement a double_numbers! method that mutates its argument?
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] *= 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
my_numbers # => [2, 8, 6, 14, 4, 12]

# Continuing on with the idea of building generic methods, let's update our double_numbers method
# to not only be able to double the values in an array, but to multiply by any number. For example,
# let's create a method called multiply that can take an additional argument to determine the
# transformation criteria.

def multiply(numbers, multiplier)
  counter = 0
  new_numbers = []

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    new_numbers << current_number * multiplier
    counter += 1
  end

  new_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]