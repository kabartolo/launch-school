# loops.rb

i = 0
loop do
  i += 1
  puts i
  break
end

i = 0
loop do
  i += 2
  puts i
  if i == 10
    break 
  end
end

i = 0
loop do
  i += 2
  if i == 4
    next        # skip rest of the code in this iteration
  end
  puts i
  if i == 10
    break
  end
end

