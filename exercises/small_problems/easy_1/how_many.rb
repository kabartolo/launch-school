# Easy 1: Exercise 4: How Many? (20 March 2017)

# Write a method that counts the number of occurrences
# of each element in a given array.

# Assume nil item not counted/printed

# Try without built-in methods
def count_occurrences(array)
  return array if array.nil? || array.empty?
  result = {}

  array.each do |item|
    if item.nil?
      next
    elsif result.include?(item)
      result[item] += 1
    else
      result[item] = 1
    end
  end

  result.each do |item, count|
    puts "#{item} => #{count}"
  end
end

# More idiomatic
def count_occurrences(array)
  return array if array.nil? || array.empty?

  result = {}

  array.each do |item|
    next if item.nil?
    result[item] = array.count(item)
  end

  result.each do |item, count|
    puts "#{item} => #{count}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
count_occurrences([])
count_occurrences([nil, nil, 2, 3])
count_occurrences(nil)
