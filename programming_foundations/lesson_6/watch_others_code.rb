# Only checks if there are balanced pairs of parentheses
# (NOT their order)
def balancer(string)
  string.count('(') == string.count(')')
end

# puts balancer("hi") == true
# puts balancer("(hi") == false
# puts balancer("(hi)(") == false
# puts balancer("(hi)") == true

# Enforce the order
def balancer(string)
  closed = true
  counter = 0

  string.each_char do |char|
    counter += 1 if char == '('
    counter -= 1 if char == ')'

    if char == '(' && closed == true
      closed = false
    elsif char == ')' && closed == false
      closed = true
    end
  end

  closed && counter == 0
end

# puts balancer("hi") == true
# puts balancer("(hi)(") == false
# puts balancer(")hi(") == false
# puts balancer("(hi") == false
# puts balancer("(hi)") == true
# puts balancer("(hi(there))") == true
# puts balancer("(hi(there)") == false # => returns true

# Actually, we just need to check if the counter goes negative at any point
def balancer(string)
  return false unless string.count('(') == string.count(')')

  counter = 0
  string.each_char do |char|
    counter += 1 if char == '('
    counter -= 1 if char == ')'

    return false if counter < 0
  end

  true
end

# puts balancer("hi") == true
# puts balancer("(hi)(") == false
# puts balancer(")hi(") == false
# puts balancer("(hi") == false
# puts balancer("(hi)") == true
# puts balancer("(hi(there))") == true
# puts balancer("(hi(there)") == false # => returns true

def prime?(num)
  (2...num).all? do |divisor|
    num.to_f % divisor.to_f > 0
  end
end

def find_primes(start, stop)
  (start..stop).select { |num| prime?(num) }.join(', ')
end

p find_primes(3, 10)
p find_primes(5, 20)
