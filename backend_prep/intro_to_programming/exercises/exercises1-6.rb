### Exercise 1

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.each do |num|
  puts num
end



### Exercise 2

array.each do |num|
  if num > 5
    puts num
  end
end

# one line

array.each do { |num| puts num if num > 5 }



### Exercise 3

# one line

odd_nums = array.select { |num| num % 2 == 1 }

p odd_nums

# block

odd_nums = array.select do |num|
  if num % 2 == 1 # can remove if block altogether
    num
  end
end

p odd_nums



### Exercise 4

array.push(11)
# OR 
# array << 11
array.unshift(0)

p array



### Exercise 5

array.delete(11) # index of 11 is also 11
# OR 
# array.pop
array.push(3)
# OR 
# arr << 3

p array



# Exercise 6

p array.uniq