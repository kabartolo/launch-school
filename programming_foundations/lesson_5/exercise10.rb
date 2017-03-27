# 101 Lesson 5: Exercises (27 March 2017)
# Exercise 10

# Given the following data structure and without modifying
# the original array, use the map method to return a new
# array identical in structure to the original but where the
# value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# NOTE: Just wanted to see if this would work
# (it does)
new_arr = arr.map do |hash|
  hash.map do |letter, num| 
    [letter, num += 1]
  end.to_h # weird!
end

p new_arr

# Less weird solution
new_arr = arr.map do |hash|
  new_hash = {}
  hash.each do |letter, num|
    new_hash[letter] = num + 1
  end
  new_hash
end

p new_arr 

# Launch School second solution

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]