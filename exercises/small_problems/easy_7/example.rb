def removNb(n)
  num_array = (1..n).to_a
  total_sum = num_array.reduce(:+)
  possible_pairs = num_array.product(num_array).map(&:sort!).uniq!

  possible_pairs.select do |pair|
    total_sum - pair.reduce(:+) == pair.reduce(:*)
  end
end

def find_all_n_with_removable_numbers(max)
  n = 1
  while n < max
    matches = removNb(n)
    p matches unless matches.empty?
    n += 1
  end
end

def choose_two(sorted_array)
  sorted_array.each_with_index do |num, index|
    
end

group = (1..10).to_a
# p removNb(10)
# p removNb(4000)
# p removNb(26) #== [[15, 21], [21, 15]]
# # puts removNb(100) == []
# p removNb(50)
# p removNb(78)
# p removNb(450)
# p removNb(55)

# find_all_n_with_removable_numbers(500)