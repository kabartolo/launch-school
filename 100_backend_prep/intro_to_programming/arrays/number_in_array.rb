# Arrays: Exercise 1

arr = [1, 3, 5, 7, 9, 11]
target = 3

arr.each do |num|
  if num == target
    puts true
  end
end

# Alternative solution (from book)

if arr.include?(target)
  puts "#{target} is indeed in the array."
end