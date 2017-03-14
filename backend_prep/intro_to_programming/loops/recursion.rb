# recursion.rb

def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end

# fibonacci!


def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(6)