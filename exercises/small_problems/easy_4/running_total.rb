# Easy 4: Exercise 6: Running Totals (6 April 2017)

# Write a method that takes an Array of numbers, and returns an Array with
# the same number of elements, and each element has the running total from
# the original Array.

# map
def running_total(array)
  sum = 0
  array.map { |num| sum += num }
end

# each_with_object
def running_total(array)
  sum = 0
  array.each_with_object([]) do |num, result|
    result << sum += num
  end
end

# inject
def running_total(array)
  result = []
  array.inject(0) do |total, num|
    total += num
    result << total
    total
  end

  result
end

def running_total(array)
  array.map.with_index do |_, i|
    array[0..i].inject(:+)
  end
end

puts running_total([2, 5, 13])
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
